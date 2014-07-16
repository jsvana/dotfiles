#!/bin/bash
mkdir ~/go

mkdir ~/Projects

bin_link show-hidden
bin_link hide-hidden

# Setup homebrew
brew bundle

./config-setup.sh

# OSX options setup
./osx-setup.sh
