#!/usr/bin/env bash
# oakthree
# @tmux, abstracted
# This file switches between oakthree projects.

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/utils.sh

SESSION="$(tmux_get_session)"

project=$($TM list-windows -t ot -F "#{window_name} [#{window_index}]")

# Remove the "bash" window. Easier than managing the number of windows
# remaining.
project=$(echo "$project" | sed '1d') # Deletes the first line in $project

# Remove the last window from the list if we're already in the target session.
# This is so the fzf window doesn't show up.
if [ "$SESSION" == "ot" ]; then
  project=$(echo "$project" | sed '$d') # Deletes the last line in $project
fi

project=$(echo "$project" | \
           python $SCRIPT_DIR/filter_projects.py | \
           $FZF -n 1 --with-nth=1 --header="$(ot_make_header 'projects')" | \
           python $SCRIPT_DIR/extract_window_id.py)

if [ "$SESSION" != "ot" ]; then
  $TM switch-client -t ot\; select-window -t $project
else
  $TM select-window -t $project
fi
