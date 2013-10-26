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

alias django="python manage.py"

alias t="tmuxinator"

alias v="vagrant"
alias vl="vagrant list"
alias vssh="vagrant ssh"
alias vup="vagrant up"
alias vdown="vagrant halt"
alias vp="vagrant provision"

alias vinstall="vim +BundleInstall +qall"
