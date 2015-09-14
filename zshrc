export DOTFILES="$HOME/.dotfiles"
export PATH="/usr/local/bin:$DOTFILES/bin:$HOME/go/bin:/usr/local/share/npm/bin:$HOME/.rbenv/bin:$PATH"

export CLICOLOR=true
export EDITOR="vim"
export HISTFILE="$HOME/.zsh-history"
export HISTSIZE=SAVEHIST=10240
export LESSHISTFILE="-" # disable less history
export LSCOLORS="exfxcxdxbxegedabagacad"

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

zle -N newtab
zle -N reset-prompt

set -o vi

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# better killall completion
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

alias ls="ls --color=auto"

autoload colors; colors

hg_branch () {
  # Add a quick n' dirty optimization to make hg bookmark results faster
  if [ ! -e "$HOME/tmp/lastdir" ] || [ "$(awk '{print $1}' "$HOME/tmp/lastdir")" != "$PWD" ]; then
    if hg branch &>/dev/null; then
      text="%{$fg[blue]%}$(hg bookmark | grep '*' | awk '{print $2}')"
    else
      text=""
    fi
    echo "$PWD $text" > "$HOME/tmp/lastdir"
  fi
  awk '{print $2}' "$HOME/tmp/lastdir"
}

hg () {
  if [[ $1 == "book" ]]; then
    command hg "$@"
    hg_branch &>/dev/null
  else
    command hg "$@"
  fi
}

cwd () {
  dir="${PWD/#$HOME/~}"
  dir="${dir//\/data\/users\/jsvana/~}"
  echo "$dir"
}

PROMPT='%{$fg[green]%}%n@${HOSTNAME//.facebook.com/} %{$fg[cyan]%}$(cwd) $(hg_branch)
%(?/%{$reset_color%}/%{$fg[red]%})%(!.#.:)%{$reset_color%} '
RPROMPT="%{$fg[magenta]%}$(date +'%D %T')%{$reset_color%}"

autoload -Uz compinit
compinit -u

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ -a "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi
