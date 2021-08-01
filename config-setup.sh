#!/bin/bash

if [[ -n "$1" ]]; then
  CONFIG_USER="$1"
else
  CONFIG_USER="$USER"
fi


function config_link {
  if [[ ! -e /home/$CONFIG_USER/.$1 ]]; then
    ln -s `pwd`/$1 /home/$CONFIG_USER/.$1
  fi
}

config_link xinitrc
config_link Xdefaults
config_link Xresources
config_link Xdefaults.d

config_link gitconfig
config_link gitignore
config_link hgrc

config_link ackrc
config_link irbrc
config_link editrc
config_link ssh
config_link tmux.conf
config_link vim
config_link wgetrc

config_link zlogin
config_link zshrc
