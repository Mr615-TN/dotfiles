#!/usr/bin/env bash

# make sure it's executable with:
# Get the focused workspace
FOCUSED=$(aerospace list-workspaces --focused)

# The workspace ID is passed as $1
WORKSPACE_ID="$1"

if [ "$WORKSPACE_ID" = "$FOCUSED" ]; then
    # Highlight the focused workspace with racing red
    sketchybar --set $NAME \
        background.drawing=on \
        background.color=0xffcc0000 \
        label.color=0xfffffff8
else
    # Non-focused workspaces use pearl white background
    sketchybar --set $NAME \
        background.drawing=on \
        background.color=0xeef5f5f5 \
        label.color=0xff0a0a0a
fi
