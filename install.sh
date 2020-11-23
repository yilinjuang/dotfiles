#!/bin/bash

echo "source ~/.confJuang/bashrc" >>~/.bashrc
echo "source ~/.confJuang/tmux.conf" >~/.tmux.conf
echo "\$include ~/.confJuang/inputrc" >~/.inputrc

# gitconfig
echo "Following are Git settings: "
read -p "What's your name? " name
read -p "And your email? " email
cat >~/.gitconfig <<-EOM
[user]
    email = $email
    name = $name
[include]
    path = ~/.confJuang/gitconfig
EOM

echo "ConfJuang Installed Successfully! Enjoy~"
echo "If there are any problems please contact Yi-Lin (hi at yilinjuang dot com)"
