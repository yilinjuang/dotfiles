# import git-prompt.sh
source ~/.confJuang/git-prompt.sh

#prompt
export PS1="\[\e[1;33m\]\u \[\e[0;37m\]at \[\e[1;36m\]\h ⚡ \[\e[1;32m\]<\w>\[\e[1;34m\]\$(__git_ps1)\n➜ \[\e[0m\]"

#alias
alias l='ls -lh --color=auto'
alias ls='ls -h --color=auto'
alias ll='ls -alh --color=auto'
alias la='ls -ah --color=auto'
alias ..='cd ..'
alias ...='cd -'
alias dh='du -h --max-depth=1'
alias grep='grep --color=auto'
alias vi='vim'

if [ -n "pacman -Qs thefuck" ]; then 
    eval "$(thefuck --alias)"
fi


#editor
export EDITOR="vim"

#IM
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

#fix
. /etc/profile.d/vte.sh

# disable gnome-ssh-askpass dialogue
unset SSH_ASKPASS

# completion
# sudo 
complete -cf sudo
# git
if [ -f ~/.confJuang/git-completion.bash ]; then
      . ~/.confJuang/git-completion.bash
fi
