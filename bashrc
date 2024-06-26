# Prompt configuration
eval "$(starship init bash)"
export STARSHIP_CONFIG=~/.dotfiles/starship.toml

# Aliases
alias l='ls -lhG'
alias ls='ls -hG'
alias ll='ls -alhG'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias fzf='fzf -m --preview="cat {}" | c'

# Unlimited history size
HISTFILESIZE=
HISTSIZE=
HISTCONTROL=ignoreboth:erasedups
HISTTIMEFORMAT="%F %T "
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# Bash completion
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# Git completion
if [ -f ~/.dotfiles/git-completion.bash ]; then
    . ~/.dotfiles/git-completion.bash
fi

# Fzf shortcut
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Editor
EDITOR="vim"
