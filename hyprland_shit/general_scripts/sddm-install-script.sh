#!/bin/bash

# Colors for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Installing SDDM and required packages...${NC}"
sudo apt update
sudo apt install -y sddm qt5-default qt5-style-plugins

# Create Doom One theme directory
echo -e "${BLUE}Creating SDDM theme directory...${NC}"
sudo mkdir -p /usr/share/sddm/themes/doom-one
sudo mkdir -p /usr/share/sddm/themes/doom-one/icons

# Copy theme files
echo -e "${BLUE}Copying theme files...${NC}"
sudo cp Main.qml /usr/share/sddm/themes/doom-one/
sudo cp theme.conf /usr/share/sddm/themes/doom-one/
sudo cp metadata.desktop /usr/share/sddm/themes/doom-one/
sudo cp icons/power.svg /usr/share/sddm/themes/doom-one/icons/
sudo cp icons/restart.svg /usr/share/sddm/themes/doom-one/icons/

# Create a default background
echo -e "${BLUE}Creating background image...${NC}"
convert -size 1920x1080 xc:"#282c34" /tmp/doom-bg.jpg
sudo cp /tmp/doom-bg.jpg /usr/share/sddm/themes/doom-one/doom-bg.jpg

# Configure SDDM
echo -e "${BLUE}Configuring SDDM...${NC}"
sudo bash -c 'cat > /etc/sddm.conf.d/10-theme.conf << EOF
[Theme]
Current=doom-one
EOF'

# Set SDDM as the default display manager
echo -e "${BLUE}Setting SDDM as the default display manager...${NC}"
sudo systemctl disable lightdm gdm3 xdm wdm kdm lxdm slim 2>/dev/null || true
sudo systemctl enable sddm

# Creating Hyprland session file
echo -e "${BLUE}Creating Hyprland session file...${NC}"
sudo bash -c 'cat > /usr/share/wayland-sessions/hyprland.desktop << EOF
[Desktop Entry]
Name=Hyprland
Comment=A highly customizable dynamic tiling Wayland compositor
Exec=Hyprland
Type=Application
EOF'

echo -e "${GREEN}SDDM installation and configuration completed!${NC}"
echo -e "${GREEN}You can now restart your system to use SDDM with Hyprland.${NC}"
