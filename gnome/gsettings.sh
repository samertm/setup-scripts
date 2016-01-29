#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Turn off bell.
gsettings set org.gnome.desktop.wm.preferences audible-bell false

# Show the date.
gsettings set org.gnome.desktop.interface clock-show-date true

# Set time format to 12 hour
gsettings set org.gnome.desktop.interface clock-format '12h'

# Set capslock to ctrl
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
