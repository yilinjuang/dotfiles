#!/bin/bash

echo "source ~/.confJuang/bashrc" > ~/.bashrc
echo "source ~/.confJuang/tmux.conf" > ~/.tmux.conf
echo "\$include ~/.confJuang/inputrc" > ~/.inputrc

# gdb-peda
echo "Installing GDB peda..."
git clone https://github.com/longld/peda.git ~/.confJuang/peda
echo "source ~/.confJuang/peda/peda.py" > ~/.gdbinit

# gitconfig
echo "Following are Git settings: "
read -p "What's your name? " name
read -p "And your email? " email
cat > ~/.gitconfig <<- EOM
[user]
    email = $email
    name = $name
[include]
    path = ~/.confJuang/gitconfig
EOM

echo "ConfJuang Installed Successfully! Enjoy~"
echo "Any problem please contact Yi-Lin Juang (frankyjuang@gmail.com)"

