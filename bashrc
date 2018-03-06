###################
#     General     #
###################

# prompt
export PS1="\[\e[1;33m\]\u\[\e[0m\] \[\e[0;37m\]at\[\e[0m\] \[\e[1;36m\]\h\[\e[0m\] \[\e[0;37m\]⚡\[\e[0m\] \[\e[1;32m\]<\w>\[\e[0m\]\[\e[1;34m\]\$(__git_ps1)\[\e[0m\] \[\e[0;35m\]\${timer_show}\[\e[0m\]\n"

# Last command elapsed time.
function timer_now {
    gdate +%s%N
}

function timer_start {
    timer_start=${timer_start:-$(timer_now)}
}

function timer_stop {
    local delta_us=$((($(timer_now) - $timer_start) / 1000))
    local us=$((delta_us % 1000))
    local ms=$(((delta_us / 1000) % 1000))
    local s=$(((delta_us / 1000000) % 60))
    local m=$(((delta_us / 60000000) % 60))
    local h=$((delta_us / 3600000000))
    # Goal: always show around 3 digits of accuracy
    if ((h > 0)); then timer_show=${h}h${m}m
    elif ((m > 0)); then timer_show=${m}m${s}s
    elif ((s >= 10)); then timer_show=${s}.$((ms / 100))s
    elif ((s > 0)); then timer_show=${s}.$(printf %03d $ms)s
    elif ((ms >= 100)); then timer_show=${ms}ms
    elif ((ms > 0)); then timer_show=${ms}.$((us / 100))ms
    else timer_show=${us}us
    fi
    unset timer_start
}

trap 'timer_start' DEBUG
PROMPT_COMMAND=timer_stop

# alias
LS_OPT='-G'
alias l='ls -lh $LS_OPT'
alias ls='ls -h $LS_OPT'
alias ll='ls -alh $LS_OPT'
alias la='ls -ah $LS_OPT'
alias ..='cd ..'
alias dh='du -h -d 1'
alias df='df -h'
alias grep='grep --color=auto'
alias vi='vim'
alias c='tee >(pbcopy)' # Easy for piping cli result to clipboard. Ex. cat | c
alias fzf='fzf -m --preview="cat {}" | c'

# bash history ignore duplicates
export HISTCONTROL=ignoredups

# bash completion
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    . $(brew --prefix)/share/bash-completion/bash_completion
fi
# git completion
if [ -f ~/.confJuang/git-completion.sh ]; then
    . ~/.confJuang/git-completion.sh
fi

# import git-prompt.sh
source ~/.confJuang/git-prompt.sh

# editor
export EDITOR="vim"
