# vi mode
bindkey -v

# Latency bad
export KEYTIMEOUT=1

bindkey '^P' up-history
bindkey '^N' down-history

# Backspace working even after returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

bindkey '^w' backward-kill-word

autoload -U select-word-style
select-word-style bash

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^f' edit-command-line
