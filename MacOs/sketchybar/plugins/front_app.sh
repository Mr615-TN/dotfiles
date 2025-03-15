#!/usr/bin/env zsh

ICON_PADDING_RIGHT=5

case $INFO in
"Floorp")
    ICON_PADDING_RIGHT=5
    ICON=
    ;;
"Code")
    ICON_PADDING_RIGHT=4
    ICON=󰨞
    ;;
"Docker Desktop")
    ICON_PADDING_RIGHT=3
    ICON=
    ;;
"Discord")
    ICON=
    ;;
"FaceTime")
    ICON_PADDING_RIGHT=5
    ICON=
    ;;
"Finder")
    ICON=󰀶
    ;;
"Brave Browser")
    ICON_PADDING_RIGHT=7
    ICON=
    ;;
"Ghostty")
    ICON=󰊠
    ;;
"Messages")
    ICON=
    ;;
"LocalSend")
    ICON_PADDING_RIGHT=6
    ICON=󱁜
    ;;
"Preview")
    ICON_PADDING_RIGHT=3
    ICON=
    ;;
"Spotify")
    ICON_PADDING_RIGHT=2
    ICON=
    ;;
"Zed")
    ICON_PADDING_RIGHT=3
    ICON=󰵁
    ;;
*)
    ICON_PADDING_RIGHT=2
    ICON=
    ;;
esac

sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT
sketchybar --set $NAME.name label="$INFO"
