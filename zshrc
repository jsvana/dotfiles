# Because why would you use anything else?
export EDITOR=/usr/bin/vim

# go
export GOPATH=$HOME/go

# npm
export PATH=$PATH:$HOME/bin:/usr/local/share/npm/bin:/usr/local/sbin

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH

export PROJECTS="$HOME/projects"

# OSX-specific
if [[ `uname -s` == "Darwin" ]]
then
	# brew coreutils
	export PATH=/usr/local/bin:$(brew --prefix coreutils)/libexec/gnubin:$PATH
	export HOMEBREW_CASK_OPTS="--appdir=/Applications"
	export PROJECTS="$HOME/Projects"
fi

if which rbenv &> /dev/null
then
	eval "$(rbenv init -)"
fi

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

. ~/.zsh/aliases.zsh
. ~/.zsh/bindings.zsh
. ~/.zsh/colors.zsh
. ~/.zsh/functions.zsh
. ~/.zsh/prompt.zsh
