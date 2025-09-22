#!/usr/bin/env bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Use a universal way to determine the OS
if [[ "$(uname)" == "Darwin" ]]; then
    OS_TYPE="macos"
elif [[ "$(uname)" == "Linux" ]]; then
    OS_TYPE="linux"
else
    OS_TYPE="other"
fi

# Set the variables, using macOS-specific paths if needed
confDir="${XDG_CONFIG_HOME:-$HOME/.config}"
iconDir="${XDG_DATA_HOME:-$HOME/.local/share}/icons"

if [[ "$OS_TYPE" == "macos" ]]; then
    # On macOS, use Homebrew paths or check for installed programs
    # You might need to install 'fastfetch' and 'coreutils' via Homebrew
    shuf_cmd="gshuf"
    if ! command_exists "$shuf_cmd"; then
        # Fallback if gshuf isn't available
        shuf_cmd="sort -R | head -n 1"
    else
        shuf_cmd="gshuf -n 1"
    fi
else
    # On Linux, shuf is standard
    shuf_cmd="shuf -n 1"
fi

# The rest of the script remains largely the same, but we'll use the
# corrected shuf_cmd and handle the os-release file
# Early load to maintain fastfetch speed
if [ -z "${*}" ]; then
    clear
    if command_exists fastfetch; then
        exec fastfetch --logo-type kitty
    else
        echo "Error: fastfetch not found. Please install it."
        exit 1
    fi
    exit
fi

USAGE() {
    cat <<USAGE
Usage: fastfetch [commands] [options]

commands:
  logo    Display a random logo

options:
  -h, --help,     Display command's help message

USAGE
}

# Source state and os-release
# shellcheck source=/dev/null
[ -f "$HYDE_STATE_HOME/staterc" ] && source "$HYDE_STATE_HOME/staterc"
# On Linux, source os-release; on macOS, we can't
if [[ "$OS_TYPE" == "linux" ]]; then
    # shellcheck disable=SC1091
    [ -f "/etc/os-release" ] && source "/etc/os-release"
fi

# Set the logo variable, only if on Linux with os-release
if [ -n "$LOGO" ]; then
    hyde_distro_logo="${iconDir}/Wallbash-Icon/distro/$LOGO"
fi

# Parse the main command
case $1 in
logo) # eats around 13 ms
    random() {
        (
            image_dirs=() # reset array to avoid duplication
            image_dirs+=("${confDir}/fastfetch/logo")
            image_dirs+=("${iconDir}/Wallbash-Icon/fastfetch/")
            if [ -n "${HYDE_THEME}" ] && [ -d "${confDir}/hyde/themes/${HYDE_THEME}/logo" ]; then
                image_dirs+=("${confDir}/hyde/themes/${HYDE_THEME}/logo")
            fi
            [ -d "$HYDE_CACHE_HOME" ] && image_dirs+=("$HYDE_CACHE_HOME")
            [ -f "$hyde_distro_logo" ] && echo "${hyde_distro_logo}"
            [ -f "$HOME/.face.icon" ] && echo "$HOME/.face.icon"

            find -L "${image_dirs[@]}" -maxdepth 1 -type f \( -name "wall.quad" -o -name "wall.sqre" -o -name "*.icon" -o -name "*logo*" -o -name "*.png" \) ! -path "*/wall.set*" ! -path "*/wallpapers/*.png" 2>/dev/null
        ) | eval "$shuf_cmd"
    }
    help() {
        cat <<HELP
Usage: ${0##*/} logo [option]

options:
  --quad    Display a quad wallpaper logo
  --sqre    Display a square wallpaper logo
  --prof    Display your profile picture (~/.face.icon)
  --os      Display the distro logo
  --local   Display a logo inside the fastfetch logo directory
  --wall    Display a logo inside the wallbash fastfetch directory
  --theme   Display a logo inside the hyde theme directory
  --rand    Display a random logo
  * Display a random logo
  *help* Display this help message

Note: Options can be combined to search across multiple sources
Example: ${0##*/} logo --local --os --prof
HELP
    }

    # Parse the logo options
    shift
    [ -z "${*}" ] && random && exit
    [[ "$1" = "--rand" ]] && random && exit
    [[ "$1" = *"help"* ]] && help && exit
    (
        image_dirs=() # reset array
        for arg in "$@"; do
            case $arg in
            --quad)
                echo "$HYDE_CACHE_HOME/wall.quad"
                ;;
            --sqre)
                echo "$HYDE_CACHE_HOME/wall.sqre"
                ;;
            --prof)
                [ -f "$HOME/.face.icon" ] && echo "$HOME/.face.icon"
                ;;
            --os)
                [ -f "$hyde_distro_logo" ] && echo "$hyde_distro_logo"
                ;;
            --local)
                image_dirs+=("${confDir}/fastfetch/logo")
                ;;
            --wall)
                image_dirs+=("${iconDir}/Wallbash-Icon/fastfetch/")
                ;;
            --theme)
                if [ -n "${HYDE_THEME}" ] && [ -d "${confDir}/hyde/themes/${HYDE_THEME}/logo" ]; then
                    image_dirs+=("${confDir}/hyde/themes/${HYDE_THEME}/logo")
                fi
                ;;
            esac
        done
        # Only run find if there are directories to search in
        if [ ${#image_dirs[@]} -ne 0 ]; then
            find -L "${image_dirs[@]}" -maxdepth 1 -type f \( -name "wall.quad" -o -name "wall.sqre" -o -name "*.icon" -o -name "*logo*" -o -name "*.png" \) ! -path "*/wall.set*" ! -path "*/wallpapers/*.png" 2>/dev/null
        fi
    ) | eval "$shuf_cmd"

    ;;
--select | -S)
    :

    ;;
help | --help | -h)
    USAGE
    ;;
*)
    clear
    if command_exists fastfetch; then
        exec fastfetch --logo-type kitty
    else
        echo "Error: fastfetch not found. Please install it."
        exit 1
    fi
    ;;
esac
