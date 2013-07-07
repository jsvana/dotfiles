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
config_link zlogin
config_link gitconfig
config_link hgrc
config_link tmux.conf
config_link irssi

mkdir ~/go

if [[ `uname -s` == "Darwin" ]]
then
	mkdir ~/Projects

	# Setup homebrew
	ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

	brew install wget
	brew install git
	brew install mercurial
	brew install rbenv
	brew install ruby-build

	eval "$(rbenv init -)"
elif [[ `uname -s` == "Linux" ]]
then
	if [ -e /etc/arch-release ]
	then
		sudo pacman -S wget git mercurial
		sudo -k

		read -p "Setup sshd? [Y/n]" choice
		case $choice in
				[Nn]*)
					echo "Skipping sshd"
					;;
				*) 
					# Setup SSH
					sudo $EDITOR /etc/ssh/sshd_config
					sudo systemctl restart sshd
					;;
		esac

		read -p "Setup iptables? [Y/n]" choice
		case $choice in
				[Nn]*)
					echo "Skipping iptables"
					;;
				*) 
					# iptables
					./iptables.setup
					;;
		esac

		read -p "Setup rbenv? [Y/n]" choice
		case $choice in
			[Nn]*)
				echo "Skipping rbenv"
				;;
			*)
				# rbenv
				aur_build rbenv
				eval "$(rbenv init -)"
				aur_build ruby-build
				;;
		esac

		mkdir ~/projects
	fi
fi

if $(vim --version | grep '7.3' &> /dev/null)
then
	vim +BundleInstall +qall
else
then
	echo "vim is out of date, you're gonna have a bad time"
fi
