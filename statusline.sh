#!/usr/bin/env zsh
set -e

cd "$(tmux showenv "$(tmux display -p "TMUX_PWD_#D")" | cut -d= -f2-)"

short_pwd() {
  pwd | sed "s#^$HOME#~#; s#\([a-zA-Z]\)[a-zA-Z]*[^/]*/#\1/#g"
}

git_status() {
  local unstaged="$(git diff-files | wc -l)"
  local staged="$(git diff-index --cached HEAD | wc -l)"
  if [[ "$unstaged" -gt 0 ]]; then
    printf " #[fg=colour3]%d waiting " "$unstaged"
  fi
  if [[ "$staged" -gt 0 ]]; then
    printf " #[fg=colour1]%d staged " "$staged"
  fi
}

git_since() {
  local seconds="$(git since)"
  if [[ "$seconds" -gt 3600 ]]; then
    printf " #[fg=colour9]$((seconds / 3600))h$((seconds % 3600 / 60))m "
  elif [[ "$seconds" -gt 60 ]]; then
    printf " #[fg=colour2]$((seconds / 60))m "
  else
    printf " #[fg=colour2]<1m "
  fi
}

git_branch() {
  printf " #[fg=colour5]$(git rev-parse --abbrev-ref HEAD) "
}

git_pwd() {
  local color
  if git trusted; then
    color="colour9"
  else
    color="colour4"
  fi
  printf " #[fg=$color]%s" "$(short_pwd)"
}

hg_branch() {
  printf " #[fg=colour5]$(hg bookmark | grep '*' | awk '{ print $2; }')"
}

wifi() {
  local state="$(airport -I | grep state | awk '{print $2; }')"

  printf " #[fg=colour11]"
  if [[ -n "$state" ]]; then
    if [[ "$state" -eq "running" ]]; then
      printf "+"
    else
      printf "±"
    fi
  else
    printf "-"
  fi
}

battery() {
  if which acpi >/dev/null; then
    printf " #[fg=colour6]%s" "$(acpi -b | sed -r 's/^.*, ([0-9]+)%.*/\1/')%"

    if acpi -b | grep -E '(Charging|Full)' &> /dev/null; then
      printf " \u26a1"
    fi
  else
    printf " #[fg=colour6]%s" "$(pmset -g ps  |  sed -n 's/.*[[:blank:]]+*\(.*%\).*/\1/p')"
  fi
}

volume() {
  local vol=$(osascript -e 'get volume settings' | awk 'BEGIN { FS = ", " } ; { print $1 }' | awk 'BEGIN { FS = ":" } ; { print $2 }')
  printf " #[fg=colour24]"
  # Check if muted
  if osascript -e 'get volume settings' | grep true >/dev/null; then
    printf "muted"
  else
    printf "%s <" "$vol"
    if [[ "$vol" -gt "80" ]]; then
      printf ")))"
    elif [[ "$vol" -gt "40" ]]; then
      printf "))"
    elif [[ "$vol" -gt "0" ]]; then
      printf ")"
    fi
  fi
}

date_f() {
  printf " #[fg=colour9]%s" "$(date +"%d %b %H:%M")"
}

ssh_conn() {
  if [[ -n "$SSH_CONNECTION" ]]; then
    printf " #[fg=colour9](ssh)"
  fi
}

tmux_session_name() {
  printf " #[fg=colour13]%s" "$(tmux display-message -p '#S')"
}

normal_pwd() {
  printf " #[fg=colour4]%s" "$(short_pwd)"
}

tmux_session_name
if [[ -n "$SSH_CONNECTION" ]]; then
  ssh_conn
else
  wifi
  battery
  volume
fi
date_f
if git root &> /dev/null; then
  git_status
  git_since
  git_branch
  git_pwd
else
  normal_pwd
fi
