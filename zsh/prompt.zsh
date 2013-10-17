. ~/.zsh/colors.zsh
. ~/.zsh/functions.zsh

autoload -U promptinit
promptinit

autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr "${fg_blue}?"
zstyle ':vcs_info:*' unstagedstr "${fg_brown}?"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git

precmd() {
	if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]]
	then
		zstyle ':vcs_info:*' formats "${fg_blue}⑁%c%u${at_normal} "
	else
		zstyle ':vcs_info:*' formats "${fg_blue}⑁%c%u${fg_red}!${fg_dgray}${at_normal} "
	fi

	vcs_info
}

ssh_conn() {
	if [[ -n $SSH_CONNECTION ]]
	then
		echo "${fg_red}\u2388${at_normal} "
  fi
}

battery_prompt() {
	BATTERY=$(battery)
	if [[ -n $BATTERY ]]
	then
		echo " ${fg_green}[$BATTERY${fg_green}]"
	fi
}

setopt prompt_subst

case `hostname` in
	'athena')
		prompt_start_char='∀'
		;;
	'hephaestus')
		prompt_start_char='⚒'
		;;
esac

PROMPT=$'${fg_green}${prompt_start_char}${at_normal}$(ssh_conn)${vcs_info_msg_0_}%2c%(?/${at_normal}/${fg_red})%(!.#.:)${at_normal} '
RPROMPT="${fg_dgray}%T${at_normal}"

INSERT_PROMPT="gray"
COMMAND_PROMPT="red"

set_prompt_color() {
  if [[ $TERM = "linux" ]]
	then
    # Nothing
  elif [[ $TMUX != '' ]]
	then
		printf '\033Ptmux;\033\033]12;%b\007\033\\' "$1"
  else
		echo -ne "\033]12;$1\007"
  fi
}

# Change cursor color basing on vi mode
zle-keymap-select() {
  if [ $KEYMAP = vicmd ]
	then
		set_prompt_color $COMMAND_PROMPT
  else
		set_prompt_color $INSERT_PROMPT
  fi
}

zle-line-finish() {
  set_prompt_color $INSERT_PROMPT
}

zle-line-init() {
  zle -K viins
  set_prompt_color $INSERT_PROMPT
}

zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish
