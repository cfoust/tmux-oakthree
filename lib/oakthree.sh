#!/usr/bin/env bash
# oakthree
# @tmux, abstracted
# A small set of common logic for working with tmux sessions and fzf.

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export BIN_DIR="$SCRIPT_DIR"/../bin

export OT_PREFIX="ot"
export OT_SHELL_SUFFIX="~"
export OT_PROJECTS="$OT_PREFIX"
export OT_SHELLS="$OT_PREFIX$OT_SHELL_SUFFIX"
export OT_CENTER_CHANNEL="ot-center-channel"

# Wrapped executables. We wrap some calls to tmux and fzf so that we can extend
# their functionality and make consistent UI's according to some global
# configuration.

_tmux() {
  # TODO Be more intelligent about finding tmux
  local tmux_bin
  tmux_bin=/usr/local/bin/tmux

  # Act as a kind of namespace for adding functionality to tmux.
  local target_script
  target_script="$SCRIPT_DIR/tmux/$1"

  if [ -f "$target_script" ]; then
    shift
    bash "$target_script" "$@"
    return $?
  fi

  $tmux_bin "$@"
}

# If a session does not exist, create it.
_ensure_session() {
  if ! _tmux list-sessions -F '#{session_name}' | grep "$1" > /dev/null; then
    _tmux new-session -d -s "$1"
  fi
}

ensure_sessions() {
  _ensure_session "$OT_PROJECTS"
  _ensure_session "$OT_SHELLS"
}

_fzf() {
  fzf --margin 30%,30% "$@"
}
