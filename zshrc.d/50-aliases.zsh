if [[ `uname -s` == 'Linux' ]]
then
	alias ls="ls --color=auto"
elif [[ `uname -s` == 'Darwin' ]]
then
	alias ls="ls -G"
fi

alias source_zsh="source $DOTFILES/zshrc"

alias vi="vim"
alias vrc="vim $DOTFILES/vimrc"

alias gp="git pull --rebase"
alias stt="subl ."
alias m="mutt"
alias nb="newsbeuter"
alias :wq="exit"

alias django="python manage.py"
alias django2="python2 manage.py"

alias t="tmuxinator"
alias mux="t start"

alias v="vagrant"
alias vl="vagrant list"
alias vssh="vagrant ssh"
alias vup="vagrant up"
alias vdown="vagrant halt"
alias vp="vagrant provision"

alias vinstall="vim +BundleInstall +qall"
