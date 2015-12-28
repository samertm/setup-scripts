#!/bin/bash

# Set up Gnome 3.

set -euo pipefail
IFS=$'\n\t'

# Turn off bell.
gsettings set org.gnome.desktop.wm.preferences audible-bell false
