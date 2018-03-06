#!/bin/bash

echo "source ~/.confJuang/bashrc" >> ~/.bashrc
echo "source ~/.confJuang/tmux.conf" > ~/.tmux.conf
echo "\$include ~/.confJuang/inputrc" > ~/.inputrc
echo "module.exports = {'extends': '$HOME/.confJuang/eslintrc.js'}" > ~/.eslintrc.js
# Generate stylelintrc.
if [ ! -z $NVM_DIR ]; then
    dir="$(find $NVM_DIR -type d -name stylelint-config-standard)"
    if [ ! -z $dir ]; then
        echo "module.exports = {'extends': '$dir'}" > ~/.stylelintrc.js
    fi
fi


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
echo "Any problem please contact Yi-Lin Juang (frankyjuang at gmail dot com)"
