#!/usr/bin/env bash
#
# Initialize oakthree into the current tmux server.

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux source-file "$SCRIPT_DIR/oakthree.conf"
