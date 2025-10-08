#!/usr/bin/env bash

# This script monitors aerospace workspace changes and triggers sketchybar updates

aerospace list-workspaces --all --monitor | while read -r workspace; do
    sketchybar --trigger aerospace_workspace_change
done
