#!/usr/bin/env bash
#
# Initialize oakthree into the current tmux server.

BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $BASE_DIR/lib/oakthree.sh

BIN_DIR="$BASE_DIR/bin"

# Hide the useless status bar
_tmux set -g status off

# Make pane borders nearly invisible
_tmux set -g pane-active-border-fg black
_tmux set -g pane-active-border-bg default

# For debugging
_tmux bind q kill-server

# Convert any shell into an oakthree project.
_tmux bind o run-shell "bash $BIN_DIR/new-project"

# Create a new shell in the current directory.
# This can be done both in shells and in projects.
_tmux bind j run-shell "bash $BIN_DIR/new-shell"
_tmux bind k new-window "bash $BIN_DIR/switch-project"
_tmux bind l new-window "bash $BIN_DIR/switch-shell"

# TODO mechanism for killing projects and shells
# _tmux bind "\;"

# Switch back and forth between the editor and the shell inside a project.
_tmux bind -n "C-l" if-shell "bash $BIN_DIR/is-shell #{window_name}" \
  'next-window' \
  'previous-window'

# Switch back and forth between the project workspace and the shells.
_tmux bind "C-l" if-shell "bash $BIN_DIR/is-shell #{session_name}" \
  "switch-client -t $OT_PROJECTS" \
  "switch-client -t $OT_SHELLS"

# Create a window flanked by two blank panes so that things are centered.
# For now this is just a placeholder as the intention is to move it.
_tmux bind g run-shell "bash $BASE_DIR/lib/tmux/center"

# You have to wait for the new-session that gets called after tmux reads config files
# in order to do any session/window/pane initialization.
_tmux set-hook -g after-new-session "run-shell 'bash $BIN_DIR/bootstrap'"
