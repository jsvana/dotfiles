#!/bin/bash
mkdir ~/go

mkdir ~/Projects

bin_link show-hidden
bin_link hide-hidden

# Setup homebrew
brew bundle

# Copy configs
RCRC=./rcrc rcup

# Grab all the submodules
git submodule update --init

# Install some bundles
vim +BundleInstall +qall

# OSX options setup
./osx-setup.sh

# Change to zsh
chsh -s $(which zsh)
