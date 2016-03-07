#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cd $HOME/src
if [ ! -d emacs ]; then
    git clone samer@git.sv.gnu.org:/srv/git/emacs.git
fi
cd emacs

EMACS=emacs-24.5

git checkout $EMACS

sudo apt-get build-dep emacs24
./autogen.sh
./configure --prefix /usr/local/stow/$EMACS
make -j16
sudo make install
cd /usr/local/stow
sudo stow $EMACS

