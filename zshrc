export DOTFILES="$HOME/.dotfiles"
export PATH="$HOME/bin:$DOTFILES/bin:$PATH"

export CLICOLOR=true
export EDITOR="/usr/bin/vim"
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

KEYTIMEOUT=1

zle -N newtab

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

zstyle ':completion:*' menu select

bindkey '^[[Z' reverse-menu-complete

# better killall completion
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

# Goodbye ^S and ^Q
stty -ixon

autoload colors; colors

autoload -Uz compinit
compinit -u

function zvm_config() {
  ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_NEX
  ZVM_CURSOR_STYLE_ENABLED=false
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
}

function zvm_after_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

alias vim="nvim -O"

eval "$(starship init zsh)"

if [[ -a "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi
