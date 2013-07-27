if [[ `uname -s` == 'Linux' ]]
then
	alias ls="ls --color=auto"
elif [[ `uname -s` == 'Darwin' ]]
then
	alias ls="ls -G"
fi

alias vi="vim"

alias gp="git pull --rebase"
alias stt="subl ."
alias m="mutt"
alias nb="newsbeuter"
alias :wq="exit"

alias vinstall="vim +BundleInstall +qall"
