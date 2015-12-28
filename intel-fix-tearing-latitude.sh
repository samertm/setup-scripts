#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# https://wiki.archlinux.org/index.php/Intel_graphics#Tips_and_tricks
# https://wiki.archlinux.org/index.php/GNOME#Troubleshooting
sudo cp ./res/20-intel.conf /usr/share/X11/xorg.conf.d/20-intel.conf

# Test that this works by checking /var/log/Xorg.0.log for "TearFree".
