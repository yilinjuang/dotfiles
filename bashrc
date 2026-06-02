# Bash Configuration

# Prompt
export STARSHIP_CONFIG=~/.dotfiles/starship.toml
eval "$(starship init bash)"

# Aliases
alias l='ls -lhG'
alias ls='ls -hG'
alias ll='ls -alhG'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.DS_Store,node_modules}'

# History
HISTFILESIZE=50000
HISTSIZE=50000
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE="ls:ll:cd:pwd:bg:fg:history:clear"
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
shopt -s histappend
# Keep typed history in a file tools/agents don't know about. Bash inherits
# HISTFILE as exported from somewhere up the chain, and a plain assignment
# doesn't strip that flag — so explicitly un-export. Tools' bash subshells
# then fall back to bash's compiled-in default ~/.bash_history (a scratch
# file they can clobber freely) instead of inheriting ours.
HISTFILE="$HOME/.bash_history_typed"
export -n HISTFILE
# Sync history across tabs immediately: append this session's new entries,
# then pull in entries appended by other sessions since last prompt.
[[ "$PROMPT_COMMAND" == *"history -a; history -n"* ]] || \
    export PROMPT_COMMAND="history -a; history -n${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

# Git completion (from https://github.com/git/git/blob/master/contrib/completion/git-completion.bash)
if [ -f ~/.dotfiles/git-completion.bash ]; then
    source ~/.dotfiles/git-completion.bash
fi

# Shell enhancements
shopt -s autocd cdspell dirspell globstar nocaseglob

# Fzf
FZF_DEFAULT_OPTS='-m --style full --preview "fzf-preview.sh {}"'
FZF_CTRL_R_OPTS='--wrap --no-preview'
eval "$(fzf --bash)"

# Environment
export EDITOR='vim'
