#!/usr/bin/env sh
# AE86 Themed Battery Script
# Colors inspired by Takumi's Trueno and Initial D

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
    exit 0
fi

case ${PERCENTAGE} in
[8-9][0-9] | 100)
    ICON=""
    ICON_COLOR=0xfffffff8 # Tofu White - Full tank, ready to deliver
    ;;
7[0-9])
    ICON=""
    ICON_COLOR=0xfff5f5f5 # Pearl White - Still plenty of gas
    ;;
[4-6][0-9])
    ICON=""
    ICON_COLOR=0xfffff4e6 # Headlight Yellow - Caution, like driving at night
    ;;
[1-3][0-9])
    ICON=""
    ICON_COLOR=0xffff6b00 # Warning Orange - Low fuel, need to refuel soon
    ;;
[0-9])
    ICON=""
    ICON_COLOR=0xffcc0000 # Racing Red - Critical! Like redlining the 4A-GE
    ;;
esac

if [[ $CHARGING != "" ]]; then
    ICON=""
    ICON_COLOR=0xfffffff8 # Tofu White - Refueling at the gas station
fi

sketchybar --set $NAME \
    icon=$ICON \
    label="${PERCENTAGE}%" \
    icon.color=${ICON_COLOR} \
    label.color=0xfffffff8
