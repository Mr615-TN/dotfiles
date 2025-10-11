#!/usr/bin/env zsh

update_space() {
    # Read the focused workspace ID directly from the environment variable 
    # passed by the aerospace.toml trigger.
    SPACE_ID="$FOCUSED_WORKSPACE"

    # Fallback if the variable is empty (e.g., on initial load)
    if [ -z "$SPACE_ID" ]; then
        # Revert to your original reliable method for initial load/fallback
        SPACE_ID=$(aerospace list-workspaces --focused 2>/dev/null)
        if [ -z "$SPACE_ID" ]; then
            SPACE_ID="1"
        fi
    fi

    # The label is the most reliable way to display the number
    LABEL_TEXT=$SPACE_ID
    
    # Use a specific icon for space 1 (like your friend's example) and numbers for the rest
    case $SPACE_ID in
    1)
        # Use the specific icon for space 1 (example: a dev icon)
        ICON_TEXT= 
        ;;
    *)
        # Use a blank icon for all other spaces since the number is in the label
        ICON_TEXT="" 
        ;;
    esac

    # Ensure consistent padding
    ICON_PADDING_LEFT=10
    ICON_PADDING_RIGHT=10
    
    # Set the item properties
    sketchybar --set $NAME \
        icon="$ICON_TEXT" \
        icon.padding_left=$ICON_PADDING_LEFT \
        icon.padding_right=$ICON_PADDING_RIGHT \
        label="$LABEL_TEXT" \
        label.drawing=yes
}

case "$SENDER" in
"mouse.clicked")
    # Reload sketchybar
    sketchybar --remove '/.*/'
    source $HOME/.config/sketchybar/sketchybarrc
    ;;
*)
    update_space
    ;;
esac
