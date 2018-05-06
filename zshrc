export DOTFILES="$HOME/.dotfiles"
export PATH="$HOME/bin:/usr/local/bin:$DOTFILES/bin:$HOME/go/bin:/usr/local/share/npm/bin:$HOME/.rbenv/bin:$PATH"

export CLICOLOR=true
export EDITOR="/usr/bin/vim"
export HISTFILE="$HOME/.zsh-history"
export HISTSIZE=SAVEHIST=10240
export LESSHISTFILE="-" # disable less history
export LSCOLORS="exfxcxdxbxegedabagacad"

export GOPATH="$HOME/go"

setopt APPEND_HISTORY
setopt AUTO_CD
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
setopt CORRECT
setopt EXTENDED_GLOB
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt NO_HUP
setopt NO_LIST_BEEP
setopt PROMPT_SUBST

unsetopt CASE_GLOB

KEYTIMEOUT=1

zle -N newtab

set -o vi

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

zstyle ':completion:*' menu select

bindkey '^[[Z' reverse-menu-complete

# better killall completion
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

alias ls="ls --color=auto"

# Goodbye ^S and ^Q
stty -ixon

autoload colors; colors

cwd () {
  dir="${PWD/#$HOME/~}"
  dir="${dir//\/data\/users\/$USER/~}"
  echo "$dir"
}

export LS_COLORS="no=00:\
fi=00:\
di=01;36:\
ln=01;36:\
pi=40;33:\
so=01;35:\
do=01;35:\
bd=40;33;01:\
cd=40;33;01:\
or=40;31;01:\
ex=01;32:\
*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:\
*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:\
*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:\
*.ogg=01;35:*.mp3=01;35:*.wav=01;35:\
";

PROMPT='%{$fg[green]%}%n@$(hostname) %{$fg[magenta]%}%W %T %{$fg[cyan]%}$(cwd)%{$fg[yellow]%}
%{$fg[blue]%}$(vi_mode)%(?/%{$reset_color%}/%{$fg[red]%})%(!.#.:)%{$reset_color%} '

function vi_mode() {
  local mode
  mode="${${KEYMAP/vicmd/N}/(main|viins)/I}"
  if [ -z "$mode" ]; then
    echo -n "I"
  else
    echo -n "$mode"
  fi
}

function zle-line-init zle-keymap-select {
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

autoload -Uz compinit
compinit -u

alias -r vim='vim -O'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias screenshot="deepin-screenshot -s $HOME/Pictures/screenshots"

alias vimw="vim -u ~/.vim/vimrc_writing"

if [[ -a "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi
