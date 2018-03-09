#!/usr/bin/env bash
# oakthree
# @tmux, abstracted
# This file switches between oakthree shells.

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/utils.sh

SESSION="$(tmux_get_session)"

project=$($TM list-windows -t ot~ -F "#{pane_current_path} #{pane_current_command} [#{window_index}]")

# Remove the last window from the list if we're already in the target session.
# This is so the fzf window doesn't show up.
if [ "$SESSION" == "ot~" ]; then
  project=$(echo "$project" | sed '$d') # Deletes the last line in $project
fi

project=$(echo "$project" | \
          $FZF -n 1..2 --with-nth=1,2 --header="$(ot_make_header 'shells')" | \
          python $SCRIPT_DIR/extract_window_id.py)

if [ "$SESSION" != "ot~" ]; then
  $TM switch-client -t ot~\; select-window -t $project
else
  $TM select-window -t $project
fi
