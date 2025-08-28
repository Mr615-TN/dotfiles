#!/bin/bash
#
# Initial D Themed Sway and System Setup for EndeavourOS
# This script and the following configuration files are designed to set up a new
# EndeavourOS installation with Sway, configured with an "Initial D" theme.
# It handles adding the Chaotic-AUR and BlackArch repositories,
# installs necessary packages, and provides all the config files.

# -----------------------------------------------------------------------------
# --- SECTION 1: SYSTEM SETUP & PACKAGE INSTALLATION ---
# -----------------------------------------------------------------------------

echo "----------------------------------------"
echo "--- Starting System Setup Script     ---"
echo "----------------------------------------"

# Ensure script is run as root or with sudo
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

# Add the Chaotic-AUR repository
echo "Adding Chaotic-AUR repository..."
pacman-key --recv-key FBA2203F1372E339 --keyserver keyserver.ubuntu.com
pacman-key --lsign-key FBA2203F1372E339
pacman-key --finger FBA2203F1372E339
echo "
[chaotic-aur]
Include = /etc/pacman.d/chaotic-aur" >>/etc/pacman.conf

# Add the BlackArch repository
echo "Adding BlackArch repository..."
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
./strap.sh
rm strap.sh

# Update pacman and sync repositories
echo "Updating system and syncing repositories..."
pacman -Syyu --noconfirm

# Install all necessary packages, including the ones from your screenshot
echo "Installing core packages and user-requested tools..."
pacman -S --noconfirm \
    sway swaylock waybar mako kitty \
    zsh zsh-autosuggestions zsh-completions \
    oh-my-posh-bin \
    eza lazygit lazydocker docker-cli \
    amfora zathura imv cava \
    firefox brave-browser chromium ferdium notion-app-bin \
    ttf-firacode-nerd ttf-nerd-fonts-symbols \
    emacs-git # Doom Emacs requires a recent Emacs version, so we install from git

echo "Package installation complete. Proceed with configuration."

# -----------------------------------------------------------------------------
# --- SECTION 2: SWAY CONFIGURATION (~/.config/sway/config) ---
# -----------------------------------------------------------------------------

# Note: Replace this file with your user's existing config or add it after
# the user has logged in to the new environment.
# This config will be copied to ~/.config/sway/config

echo '#
# Initial D Themed Sway Configuration
# Low-resource, 10-workspace setup.
# Colors inspired by Initial D (dark, white text, red/yellow accents).
#

# Set a variable for the mod key
set $mod Mod4

# Set a variable for the terminal emulator
set $term kitty

# Set a variable for the file manager
set $file_manager amfora # User requested amfora

# --- THEME & APPEARANCE ---

# Initial D themed colors
# Dark base, white text, vibrant red for accents.
set $bg_color #222222
set $text_color #f9f9f9
set $accent_color #ff0000

# Set a solid background color
output * bg $bg_color

# Set window borders
default_border pixel 2
default_floating_border pixel 2
for_window [class="^.*"] border pixel 2

# Set window and bar colors
client.focused          $accent_color $accent_color $text_color $text_color
client.unfocused        $bg_color $bg_color $text_color $text_color
client.urgent           #ff0000 #ff0000 $text_color #ff0000
client.placeholder      $bg_color $bg_color $text_color $text_color
client.background       #222222

# Transparent windows
# Uses a semi-transparent black for the background.
for_window [app_id="emacs"] floating enable, alpha 0.95
for_window [app_id="vesktop"] alpha 0.95
for_window [app_id="firefox"] alpha 0.95
for_window [app_id="Brave-browser"] alpha 0.95
for_window [app_id="Ferdium"] alpha 0.95
for_window [app_id="notion-app"] alpha 0.95
for_window [class="kitty"] alpha 0.95

# Set gaps
gaps inner 10
gaps outer 0

# --- WINDOW MANAGEMENT ---

# Fullscreen
bindsym $mod+f fullscreen toggle

# Change focus with arrow keys
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# Move focused window
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# Split horizontally
bindsym $mod+h splith
# Split vertically
bindsym $mod+v splitv
# Toggle between horizontal and vertical
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# Kill focused window
bindsym $mod+Shift+q kill

# --- WORKSPACES ---

# Define 10 workspaces
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# Switch to workspace
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10

# Move focused window to workspace
bindsym $mod+Shift+1 move workspace number $ws1
bindsym $mod+Shift+2 move workspace number $ws2
bindsym $mod+Shift+3 move workspace number $ws3
bindsym $mod+Shift+4 move workspace number $ws4
bindsym $mod+Shift+5 move workspace number $ws5
bindsym $mod+Shift+6 move workspace number $ws6
bindsym $mod+Shift+7 move workspace number $ws7
bindsym $mod+Shift+8 move workspace number $ws8
bindsym $mod+Shift+9 move workspace number $ws9
bindsym $mod+Shift+0 move workspace number $ws10

# Move to the workspace with the most recent window
bindsym $mod+Tab workspace back_and_forth

# --- APPLICATION BINDINGS ---

bindsym $mod+Return exec kitty
bindsym $mod+d exec "rofi -show drun"
bindsym $mod+Shift+e exec swaynag -t warning -m "Exit Sway?" -b "Power Off" "systemctl poweroff" -b "Reboot" "systemctl reboot" -b "Logout" "swaymsg exit"

# --- STATUS BAR ---

bar {
    position top
    # Use Waybar
    swaybar_command waybar
}

# --- SCREENSHOT & LOCKSCREEN ---

bindsym Print exec "grimblast copysave screen"
bindsym $mod+l exec swaylock

# --- OTHER CONFIGURATION ---

# Includes the Waybar config
include ~/.config/waybar/config

# Sets the wallpaper
# You can replace this with your favorite Initial D themed wallpaper.
# For example, a picture of the AE86 or Akina.
output * bg https://placehold.co/1920x1080/000000/FFFFFF.png?text=Initial+D+Wallpaper fill
' >~/.config/sway/config

# -----------------------------------------------------------------------------
# --- SECTION 3: WAYBAR CONFIGURATION (~/.config/waybar/config) ---
# -----------------------------------------------------------------------------
# This is a very minimal and low-resource waybar config

echo '{
    "position": "top",
    "layer": "top",
    "height": 24,
    "modules-left": [ "sway/workspaces", "sway/mode" ],
    "modules-center": [ "sway/window" ],
    "modules-right": [ "custom/emacs", "pulseaudio", "network", "cpu", "memory", "battery", "clock" ],
    "sway/workspaces": {
        "format": "{name}",
        "all-outputs": true,
        "format-icons": {
            "1": "I", "2": "II", "3": "III", "4": "IV", "5": "V", "6": "VI", "7": "VII", "8": "VIII", "9": "IX", "10": "X",
            "default": "•"
        }
    },
    "sway/mode": {
        "format": "<span style=\"italic\">{}</span>"
    },
    "sway/window": {
        "format": "{title}",
        "max-length": 80
    },
    "custom/emacs": {
        "format": "Emacs",
        "tooltip": false,
        "on-click": "emacsclient -c -a ''"
    },
    "pulseaudio": {
        "format": "{icon} {volume}%",
        "format-muted": " Muted",
        "format-icons": {
            "default": ["", "", ""]
        }
    },
    "network": {
        "format-wifi": " {essid}",
        "format-ethernet": "",
        "format-disconnected": ""
    },
    "cpu": {
        "format": " {usage}%"
    },
    "memory": {
        "format": " {percentage}%"
    },
    "battery": {
        "format": "{icon} {capacity}%",
        "format-icons": ["", "", "", "", ""]
    },
    "clock": {
        "format": " {:%H:%M:%S}"
    }
}' >~/.config/waybar/config

# -----------------------------------------------------------------------------
# --- SECTION 4: ZSHRC CONFIGURATION (~/.zshrc) ---
# -----------------------------------------------------------------------------
# This is a basic zshrc config that sources the autosuggestions and completions.
# It also configures Oh My Posh.

echo '
# Path to your Oh My Posh installation
export PATH="$PATH:$HOME/.local/bin"

# Source Zsh Autosuggestions and Completions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-completions/zsh-completions.zsh

# Set up Oh My Posh
eval "$(oh-my-posh init zsh --config /path/to/your/oh-my-posh-theme.json)"

# Aliases for user-requested tools
alias ls="eza"
alias ll="eza -l"
alias la="eza -la"
alias git="lazygit"
alias docker="lazydocker"

# You have your own Kitty, Nvim, Btop, and Starship.toml (though you use Oh My Posh)
# Make sure to copy them to your new system!
' >~/.zshrc

# -----------------------------------------------------------------------------
# --- SECTION 5: MAKO CONFIGURATION (~/.config/mako/config) ---
# -----------------------------------------------------------------------------
# This is a basic Mako config that matches the theme.

echo '
# Mako Configuration
#
# Colors
background-color=#222222
text-color=#f9f9f9
border-color=#ff0000
' >~/.config/mako/config

# -----------------------------------------------------------------------------
# --- SECTION 6: INSTRUCTIONS FOR THE USER ---
# -----------------------------------------------------------------------------

echo "----------------------------------------"
echo "--- Installation and Configuration   ---"
echo "---       is now complete!           ---"
echo "----------------------------------------"

echo "What you have done:"
echo "1. Added Chaotic-AUR and BlackArch repositories."
echo "2. Installed all the required packages."
echo "3. Created an Initial D-themed Sway configuration."
echo "4. Created Waybar and Mako configurations."
echo "5. Set up your ZSH shell with autosuggestions and Oh My Posh."

echo "What to do next:"
echo "1. Reboot your system and log in. You should now be in a fresh Sway session."
echo "2. Once in Sway, you can open your Kitty terminal and check if the theme and commands like 'eza' and 'lazygit' work."
echo "3. Remember to copy your existing configuration files for Doom Emacs, Kitty, Nvim, Btop, and Starship.toml."
echo "4. For the wallpaper, you can download an Initial D image and place it in a known location, then update the line in your Sway config."
