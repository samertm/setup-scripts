#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cd $HOME
git clone git@github.com:samertm/dotfiles
cd $HOME/dotfiles
./install.sh
