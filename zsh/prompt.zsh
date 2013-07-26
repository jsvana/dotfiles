. ~/.zsh/colors.zsh

autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr "${fg_blue}?"
zstyle ':vcs_info:*' unstagedstr "${fg_brown}?"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn

precmd() {
	if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
		zstyle ':vcs_info:*' formats "${at_normal} ${fg_dgray}(%b%c%u${fg_dgray})${at_normal}"
  } else {
		zstyle ':vcs_info:*' formats "${at_normal} ${fg_dgray}(%b%c%u${fg_red}!${fg_dgray})${at_normal}"
  }

	vcs_info
}

ssh_conn() {
	if [[ -n $SSH_CONNECTION ]]; then
		echo "${fg_red}(ssh)${at_normal} "
  fi
}

setopt prompt_subst

PROMPT=$'$(ssh_conn)${fg_lcyan}%n${at_normal}${fg_lgray}@${at_bold}${fg_brown}%m ${fg_blue}%c${vcs_info_msg_0_}\n%(?/${at_normal}/${fg_red})%%${at_normal} '
RPROMPT="${fg_dgray}%T${at_normal}"

INSERT_PROMPT="gray"
COMMAND_PROMPT="red"

set_prompt_color() {
  if [[ $TERM = "linux" ]]; then
    # Nothing
  elif [[ $TMUX != '' ]]; then
		printf '\033Ptmux;\033\033]12;%b\007\033\\' "$1"
  else
		echo -ne "\033]12;$1\007"
  fi
}

# Change cursor color basing on vi mode
zle-keymap-select() {
  if [ $KEYMAP = vicmd ]; then
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
