ZSH=$HOME/.oh-my-zsh

ZSH_THEME="jsvana"

plugins=(git nyan)

alias irssi="screen -dR irssi irssi"
alias vi="vim"

source $ZSH/oh-my-zsh.sh

alias gp="git pull --rebase"
alias stt="subl ."

export EDITOR=/usr/bin/vim

export GOPATH=$HOME/go

export PATH=$PATH:$HOME/bin:/usr/local/share/npm/bin
