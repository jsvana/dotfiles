#!/bin/bash
# Credit to @belak for the base of this

function config_link {
  if [[ ! -e ~/.$1 ]]
  then
    ln -s `pwd`/$1 ~/.$1
  fi
}

function aur_build {
  pushd .
  cower -dd $1
  cd $1
  makepkg -si
  popd
}

config_link vimrc
config_link vim
config_link oh-my-zsh
config_link zshrc
config_link gitconfig
config_link hgrc
config_link tmux.conf

# Stupid irssi
mkdir ~/.irssi
ln -s `pwd`/irssi.config ~/.irssi/config
# TODO: Setup irssi scripts (nickcolor.pl, format_identify.pl)

mkdir ~/go

if [[ `uname` == "Darwin" ]]
then
	mkdir ~/Projects
elif [[ `uname` == "Linux" ]]
then
	# Setup SSH
	sudo $EDITOR /etc/ssh/sshd_config
	sudo systemctl restart sshd

	# iptables
	./iptables.setup

	# rbenv
	aur_build rbenv
	eval "$(rbenv init -)"
	aur_build ruby-build

	mkdir ~/projects
fi

vim +BundleInstall +qall
