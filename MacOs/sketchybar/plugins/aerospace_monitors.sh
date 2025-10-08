#!/usr/bin/env bash

# This script monitors aerospace workspace changes and triggers sketchybar updates
# Save this as: ~/.config/sketchybar/plugins/aerospace_monitor.sh
# Make it executable: chmod +x ~/.config/sketchybar/plugins/aerospace_monitor.sh

# Monitor aerospace for workspace changes
aerospace list-workspaces --monitor all | while read -r line; do
    sketchybar --trigger aerospace_workspace_change
done
