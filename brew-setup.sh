#!/usr/bin/env bash

ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils
# Install Bash 4
brew install bash

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep
brew tap josegonzalez/homebrew-php
brew install php55

# Install other useful binaries
brew install git
brew install mercurial
brew install rbenv
brew install ruby-build
brew install ack
brew install node
brew install pigz
brew install rename
brew install mutt
brew install newsbeuter

brew tap homebrew/versions
brew install lua52

# Install native apps
brew tap phinze/homebrew-cask
brew install brew-cask

function cask_install() {
	brew cask install "${@}" 2> /dev/null
}

cask_install dropbox
cask_install firefox
cask_install iterm2
cask_install sublime-text
cask_install vlc
cask_install slate

# Remove outdated versions from the cellar
brew cleanup

eval "$(rbenv init -)"
