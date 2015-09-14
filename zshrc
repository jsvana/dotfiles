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

PROMPT="%(?/%{$reset_color%}/%{$fg[red]%})%(!.#.:)%{$reset_color%} "
RPROMPT="$(date +'%D %T')"

autoload -Uz compinit
compinit -u

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ -a "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi
