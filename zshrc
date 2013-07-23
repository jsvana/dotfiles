alias vi="vim"

alias gp="git pull --rebase"
alias stt="subl ."
alias m="mutt"
alias nb="newsbeuter"
alias :wq="exit"

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
	export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
	export HOMEBREW_CASK_OPTS="--appdir=/Applications"
	export PROJECTS="$HOME/Projects"
fi

eval "$(rbenv init -)"

source ~/.functions.zsh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt prompt_subst

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' squeeze-slashes true

autoload -Uz compinit promptinit vcs_info colors
compinit
promptinit
colors

zstyle ':vcs_info:hg:*' hgrevformat '%r'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' enable git hg svn
zstyle ':vcs_info:*' stagedstr '•'
zstyle ':vcs_info:*' unstagedstr '•'
zstyle ':vcs_info:*' branchformat '%b|%r'
zstyle ':vcs_info:*' actionformats " %{$fg_bold[green]%}%c%{$fg_bold[red]%}%u%{$fg[blue]%}(%s|%b|%a)%{$reset_color%}"
zstyle ':vcs_info:*' formats " %{$fg_bold[yellow]%}%c%{$fg_bold[red]%}%u%{$fg[blue]%}(%s|%b)%{$reset_color%}"
function precmd {
        vcs_info
}

function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%{$fg_bold[red]%}(ssh) "
  fi
}

stty -ixon

PROMPT=$'$(ssh_connection)%{$fg_bold[green]%}%n@%m%{$reset_color%}${vcs_info_msg_0_} %{$fg[magenta]%}<%~>%{$reset_color%}\n%# '
RPROMPT='%{$fg[green]%}%D{%R}%{$reset_color%}'
