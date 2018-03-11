#!/usr/bin/env bash
#
# Initialize oakthree into the current tmux server.

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BASE_DIR/lib/oakthree.sh

BIN_DIR="$BASE_DIR/bin"

# Hide the useless status bar
_tmux set -g status on

# Make pane borders nearly invisible
_tmux set -g pane-active-border-fg black
_tmux set -g pane-active-border-bg default

# Take over the calling session and consider all of its windows our shells.
_tmux new-session -d -s "$OT_SHELLS"
_tmux new-session -d -s "$OT_PROJECTS"

# For debugging
_tmux bind q kill-server

# Convert any shell into an oakthree project.
_tmux bind o if-shell \
  "bash $BIN_DIR/is_shell #{session_name}" \
  "run-shell 'bash $BIN_DIR/new'"

_tmux switch-client -t "$OT_SHELLS"
