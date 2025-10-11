#!/usr/bin/env bash

# This script monitors aerospace workspace changes and triggers sketchybar updates
# AeroSpace actually handles this automatically via exec-on-workspace-change
# so this script is optional/redundant

# Correct command (no --monitor flag exists):
aerospace list-workspaces --all | while read -r line; do
    sketchybar --trigger aerospace_workspace_change
done
