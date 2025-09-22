#!/bin/bash
# Install Arduino IDE 2 (Flatpak version) on Ubuntu/Debian

set -e

# Ensure flatpak is installed
if ! command -v flatpak &> /dev/null; then
    echo "Flatpak not found, installing..."
    sudo apt update
    sudo apt install -y flatpak
fi

# Add Flathub repo if missing
if ! flatpak remote-list | grep -q flathub; then
    echo "Adding Flathub remote..."
    sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

# Install Arduino IDE 2
echo "Installing Arduino IDE 2..."
flatpak install -y flathub cc.arduino.IDE2

echo "Done! You can run it with:"
echo "flatpak run cc.arduino.IDE2"
