#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Set up Gnome 3.
sudo apt-get install ubuntu-gnome-desktop

# Turn off bell.
gsettings set org.gnome.desktop.wm.preferences audible-bell false

# Set capslock to ctrl.
echo "Open the Gnome Tweak Tool. Select Typing > Ctrl key position > Caps Lock as Ctrl."
