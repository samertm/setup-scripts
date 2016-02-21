#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

. ../common/require.sh
apt_require git
sh_require ../tools/stow

cd $HOME
git clone git@github.com:samertm/dotfiles
cd $HOME/dotfiles
./clean.sh
./install.sh
