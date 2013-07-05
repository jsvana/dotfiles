ZSH=$HOME/.oh-my-zsh

ZSH_THEME="jsvana"

plugins=(git nyan)

alias vi="vim"

source $ZSH/oh-my-zsh.sh

alias gp="git pull --rebase"
alias stt="subl ."

# Because why would you use anything else?
export EDITOR=/usr/bin/vim

# go
export GOPATH=$HOME/go

# npm
export PATH=$PATH:$HOME/bin:/usr/local/share/npm/bin:/usr/local/sbin

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
