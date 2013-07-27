#!/bin/bash
# Credit to @belak for the base of this

function config_link {
  if [[ ! -e ~/.$1 ]]
  then
    ln -s `pwd`/$1 ~/.$1
  fi
}

function bin_link {
	if [[ ! -e ~/bin/$1 ]]
	then
		ln -s `pwd`/$1 ~/bin/$1
	fi
}

function aur_build {
  pushd .
  cower -dd $1
  cd $1
  makepkg -si
  popd
}

config_link gitconfig
config_link hgrc

config_link irssi
config_link mutt
config_link muttrc
config_link newsbeuter
config_link slate
config_link ssh
config_link tmux.conf
config_link vim
config_link vimrc
config_link wgetrc

config_link zlogin
config_link zsh
config_link zshrc

bin_link pocket-cli

mkdir ~/bin
mkdir ~/go

if [[ `uname -s` == "Darwin" ]]
then
	mkdir ~/Projects

	bin_link show-hidden
	bin_link hide-hidden

	# Setup homebrew
	./brew-setup.sh

 	# OSX options setup
	./osx-setup.sh
elif [[ `uname -s` == "Linux" ]]
then
	if [ -e /etc/arch-release ]
	then
		sudo pacman -S wget git mercurial unzip mosh

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

		read -p "Setup misc? [Y/n]" choice
		case $choice in
			[Nn]*)
				echo "Skipping misc"
				;;
			*)
				# misc
				./misc-linux-setup.sh
				;;
		esac

		sudo -k

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
