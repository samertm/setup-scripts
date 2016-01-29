#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Set up Gnome 3.
sudo apt-get install ubuntu-gnome-desktop

# Turn off bell.
gsettings set org.gnome.desktop.wm.preferences audible-bell false
