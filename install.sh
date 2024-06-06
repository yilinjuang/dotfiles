#!/bin/bash

echo "source ~/.dotfiles/bashrc" >>~/.bashrc
echo "source ~/.dotfiles/tmux.conf" >~/.tmux.conf
echo "\$include ~/.dotfiles/inputrc" >~/.inputrc

# gitconfig
echo "Following are Git settings: "
read -p "What's your name? " name
read -p "And your email? " email
cat >~/.gitconfig <<-EOM
[user]
    email = $email
    name = $name
[include]
    path = ~/.dotfiles/gitconfig
EOM

echo "Dotfiles Installed Successfully! Enjoy~"
echo "If there are any problems please contact Yi-Lin (hi at yilinjuang dot com)"
