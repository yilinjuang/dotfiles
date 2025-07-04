#!/bin/bash

# Dotfiles Installation Script

echo "Setting up dotfiles configuration..."

# Link configuration files
echo "source ~/.dotfiles/bashrc" >>~/.bashrc
echo "source ~/.dotfiles/tmux.conf" >~/.tmux.conf
echo "\$include ~/.dotfiles/inputrc" >~/.inputrc

# Configure Git
echo "Configuring Git..."
read -p "What's your name? " name
read -p "And your email? " email

cat >~/.gitconfig <<-EOM
[user]
    email = $email
    name = $name
[include]
    path = ~/.dotfiles/gitconfig
EOM

echo ""
echo "Dotfiles installed successfully!"
echo "Please restart your terminal or run: source ~/.bashrc"
echo ""
