#!/bin/bash
# Credit to @belak for the base of this

function config_link {
        if [[ ! -e ~/.$1 ]]
        then
                ln -s `pwd`/$1 ~/.$1
        fi
}

config_link vimrc
config_link vim
config_link oh-my-zsh
config_link zshrc
config_link gitconfig
config_link tmux.conf

# Stupid irssi
mkdir -p ~/.irssi
ln -s `pwd`/irssi.config ~/.irssi/config

vim +BundleInstall +qall
