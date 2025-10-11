#!/usr/bin/env zsh

update_space() {
    # Get the current focused workspace from aerospace (with retry)
    SPACE_ID=""
    for i in 1 2 3 4 5; do
        SPACE_ID=$(aerospace list-workspaces --focused 2>/dev/null)
        if [ -n "$SPACE_ID" ]; then
            break
        fi
        sleep 0.2
    done

    # Fallback to workspace 1 if we couldn't get it
    if [ -z "$SPACE_ID" ]; then
        SPACE_ID="1"
    fi

    # Explicitly list all 10 common workspaces and set ICON to the space number
    case $SPACE_ID in
    1|2|3|4|5|6|7|8|9|10)
        ICON=$SPACE_ID
        ICON_PADDING_LEFT=10
        ICON_PADDING_RIGHT=10
        ;;
    *)
        # Keep the wildcard for any unexpected workspace IDs (e.g., 'scratchpad' or named workspaces)
        ICON=$SPACE_ID
        ICON_PADDING_LEFT=10
        ICON_PADDING_RIGHT=10
        ;;
    esac

    sketchybar --set $NAME \
        icon="$ICON" \
        icon.padding_left=$ICON_PADDING_LEFT \
        icon.padding_right=$ICON_PADDING_RIGHT
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
