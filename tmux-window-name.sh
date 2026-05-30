#!/usr/bin/env bash
# Resolve a tmux window name as "<short-path>/<smart-command>".
# Arg: <pane_id>  (e.g. %5)
#
# Strategy: maintain a per-pane disk cache. On every call we output the
# cached name immediately, then spawn a background process to refresh
# the cache if it's stale or the inputs changed. The next call picks up
# the fresh value. This means tmux's #() never sees an empty string for
# an established pane — no flash to "/" or blank during recompute.

set -u

MAX_PATH=12
TTL=1
CACHE_DIR=${TMPDIR:-/tmp}/tmux-name-cache.$UID

pane_id="${1:-}"
[ -z "$pane_id" ] && exit 0

mkdir -p "$CACHE_DIR" 2>/dev/null
safe_id=${pane_id//[^A-Za-z0-9._-]/_}
cache_file="$CACHE_DIR/$safe_id"

read_cache() {
    [ -f "$cache_file" ] || return 1
    IFS=$'\t' read -r cached_key cached_name < "$cache_file"
}

short_path() {
    local base=${1##*/}
    case "$base" in
        core-[0-9]*)
            local rest=${base#core-}
            case "$rest" in
                *[!0-9]*) ;;
                *) base=$rest ;;
            esac
            ;;
    esac
    printf '%s' "${base:0:$MAX_PATH}"
}

smart_name() {
    local pid=$1 fallback=$2
    case "$fallback" in
        [0-9]*) printf 'claude'; return ;;
    esac
    [ -z "$pid" ] && { printf '%s' "$fallback"; return; }

    declare -A ARGS
    declare -A KIDS
    while IFS= read -r line; do
        # shellcheck disable=SC2086
        set -- $line
        [ $# -lt 2 ] && continue
        local p=$1 pp=$2
        shift 2
        ARGS[$p]="$*"
        KIDS[$pp]+="$p "
    done < <(ps -A -o pid=,ppid=,args= 2>/dev/null)

    local queue=("$pid") current k name args
    while [ ${#queue[@]} -gt 0 ]; do
        current=${queue[0]}
        queue=("${queue[@]:1}")
        for k in ${KIDS[$current]:-}; do
            queue+=("$k")
            args=${ARGS[$k]:-}
            case "$args" in
                *"nx serve "*)
                    name=$(printf '%s' "$args" | sed -n 's/.*nx serve \([A-Za-z0-9_:-][A-Za-z0-9_:-]*\).*/\1/p')
                    [ -n "$name" ] && { printf '%s' "$name"; return; }
                    ;;
                *"nx run "*)
                    name=$(printf '%s' "$args" | sed -n 's/.*nx run \([A-Za-z0-9_:-][A-Za-z0-9_:-]*\).*/\1/p')
                    [ -n "$name" ] && { printf '%s' "$name"; return; }
                    ;;
            esac
        done
    done
    printf '%s' "$fallback"
}

compute() {
    local pid=$1 fallback=$2 path=$3
    printf '%s/%s' "$(short_path "$path")" "$(smart_name "$pid" "$fallback")"
}

refresh() {
    local SEP=$'\x1f'
    local info pid fallback path key name tmp
    info=$(tmux display-message -t "$pane_id" -p "#{pane_pid}${SEP}#{pane_current_command}${SEP}#{pane_current_path}" 2>/dev/null) || return
    IFS="$SEP" read -r pid fallback path <<< "$info"
    [ -z "$path" ] && return
    key="${fallback}${SEP}${path}"
    name=$(compute "$pid" "$fallback" "$path")
    tmp=$(mktemp "$cache_file.XXXXXX") || return
    printf '%s\t%s\n' "$key" "$name" > "$tmp"
    mv -f "$tmp" "$cache_file"
}

cached_key=""
cached_name=""
read_cache

needs_refresh=1
if [ -n "$cached_name" ]; then
    mtime=$(stat -f %m "$cache_file" 2>/dev/null || echo 0)
    now=$(date +%s)
    [ $((now - mtime)) -lt $TTL ] && needs_refresh=0
fi

if [ "$needs_refresh" = "1" ]; then
    refresh
    read_cache
fi

printf '%s\n' "${cached_name:-?}"
