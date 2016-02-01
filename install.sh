#!/bin/bash

echo "source ~/.confJuang/bashrc" > ~/.bashrc
echo "source ~/.confJuang/tmux.conf" > ~/.tmux.conf
echo "$include /etc/inputrc
set completion-ignore-case On" > ~/.inputrc

echo "Following are Git settings: "
read -p "What's your name? " name
read -p "And your email? " email
echo "[user]
    email = $email
    name = $name
[include]
    path = ~/.confJuang/gitconfig" > ~/.gitconfig

echo "ConfJuang Installed Successfully! Enjoy~"
echo "Any problem please contact Yi-Lin Juang (frankyjuang@gmail.com)"

