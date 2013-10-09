#!/bin/bash
# Credit to @belak for the base of this

function aur_build {
  pushd .
  cower -dd $1
  cd $1
  makepkg -si
  popd
}

./config-setup.sh

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
		sudo pacman -S wget git mercurial unzip mosh zsh rxvt-unicode xorg-server xorg-server-utils xorg-xinit subtle

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

if $(vim --version | grep '7.4' &> /dev/null)
then
	vim +BundleInstall +qall
else
	echo "vim is out of date, you're gonna have a bad time"
fi
