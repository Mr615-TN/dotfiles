#!/bin/bash

# Simple power menu script for Rofi
# Dependencies: rofi, systemd, loginctl

# CMDs
uptime_cmd="uptime -p"
shutdown_cmd="systemctl poweroff"
reboot_cmd="systemctl reboot"
lock_cmd="loginctl lock-session"
suspend_cmd="systemctl suspend"
logout_cmd="hyprctl dispatch exit"
hibernate_cmd="systemctl hibernate"

# Options
shutdown="⏻ Shutdown"
reboot=" Reboot"
lock=" Lock"
suspend="⏾ Suspend"
logout=" Logout"
hibernate="󰤄 Hibernate"
cancel=" Cancel"

# Get system uptime
uptime=$(${uptime_cmd})

# Show options based on rofi
chosen=$(printf "%s\n%s\n%s\n%s\n%s\n%s\n%s" \
    "$shutdown" "$reboot" "$lock" "$suspend" \
    "$logout" "$hibernate" "$cancel" | \
    rofi -dmenu -i -p "System" -theme doom-one)

# Execute based on selection
case "$chosen" in
    "$shutdown")
        ${shutdown_cmd}
        ;;
    "$reboot")
        ${reboot_cmd}
        ;;
    "$lock")
        ${lock_cmd}
        ;;
    "$suspend")
        ${suspend_cmd}
        ;;
    "$logout")
        ${logout_cmd}
        ;;
    "$hibernate")
        ${hibernate_cmd}
        ;;
    *)
        # Cancel - exit doing nothing
        exit 0
        ;;
esac

# Make script executable
chmod +x ~/.config/rofi/scripts/power-menu.sh
