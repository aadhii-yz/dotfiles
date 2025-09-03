#!/bin/bash

## Helper script that opens the selected file in the tmux 2nd window inside helix

# Window index 2 (one-based indexing)
WINDOW="2"

# Check if window 2 exists
if ! tmux list-windows -F "#{window_index}" | grep -q "^$WINDOW$"; then
    # Create window 2 in detached mode, named "helix"
    tmux new-window -d -t $WINDOW -n helix
fi

# Collect only files (ignore directories)
files=()
for f in "$@"; do
    if [ -f "$f" ]; then
        files+=("$f")
    fi
done

# Nothing to open? Exit silently
if [ ${#files[@]} -eq 0 ]; then
    exit 0
fi

# Check if helix is running in window 2
if tmux list-panes -t $WINDOW -F "#{pane_current_command}" | grep -Eq "^(hx|helix)$"; then
    # Helix already running -> open file in new buffer
    for f in "${files[@]}"; do
        tmux send-keys -t $WINDOW ":open $f" Enter
    done
else
    # No helix yet -> start helix with file
    cmd="hx"
    for f in "${files[@]}"; do
        cmd="$cmd \"$f\""
    done
    tmux send-keys -t $WINDOW "$cmd" Enter
fi

# Auto-close Yazi only if requested
if [ "${YAZI_AUTOQUIT:-0}" = "1" ]; then
    kill -s SIGTERM $PPID
fi
