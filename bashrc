# Bash Configuration

# Prompt
eval "$(starship init bash)"
export STARSHIP_CONFIG=~/.dotfiles/starship.toml

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
export PROMPT_COMMAND="history -a; history -r; $PROMPT_COMMAND"

# Git completion (from https://github.com/git/git/blob/master/contrib/completion/git-completion.bash)
if [ -f ~/.dotfiles/git-completion.bash ]; then
    source ~/.dotfiles/git-completion.bash
fi

# Shell enhancements
shopt -s autocd cdspell dirspell globstar nocaseglob

# Fzf
FZF_DEFAULT_OPTS='-m --style full --preview "fzf-preview.sh {}"'

# Environment
export EDITOR='vim'
