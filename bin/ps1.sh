#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/utils.sh

OLD_PS1=$PS1

ot_ps1() {
  SESSION="$(tmux_get_session)"
  WINDOW="$(tmux_get_window)"

  #PS1=' \[\e[0;31m\]▸▸$(basename $(pwd))▹\[\e[0m\] \[\e[0;31m\]\[\e[0m\]\[\033[00m\]'
  PWD_BEFORE='\[\e[38;5;240m\[\e[48;5;131m\[\e[38;5;231m\[\e[48;5;131m'
  TM_PWD=$(tmux display-message -p "$(basename $(pwd)) #[fg=colour131,bg=colour240,nobold,nounderscore,noitalics]")

  if [ "$SESSION" == "ot" ]; then
    TM_WINDOW=$(tmux display-message -p "#[fg=colour231,bg=colour180] #W #[fg=colour180,bg=colour240]")
    echo "$PWD_BEFORE $TM_WINDOW $TM_PWD"
    return 0
  else
    echo "$PWD_BEFORE $TM_PWD"
    return 0
  fi
}

# Use a custom PS1 that changes depending on where we are.
PS1='$(ot_ps1)'
