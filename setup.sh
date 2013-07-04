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
if [[ `uname` != "Darwin" ]]
then
	mkdir ~/.irssi
	ln -s `pwd`/irssi.config ~/.irssi/config
fi

mkdir ~/go

if [[ `uname` == "Darwin" ]]
then
	mkdir ~/Projects
elif [[ `uname` == "Linux" ]]
then
	mkdir ~/projects
fi

vim +BundleInstall +qall
