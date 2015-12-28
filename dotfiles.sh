#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

. require.sh
apt_require git
sh_require stow

cd $HOME
git clone git@github.com:samertm/dotfiles
cd $HOME/dotfiles
./install.sh
