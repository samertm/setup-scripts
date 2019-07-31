#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cd $HOME/src
if [ ! -d emacs ]; then
    git clone https://git.savannah.gnu.org/git/emacs.git
fi
cd emacs

EMACS=emacs-26.2

git checkout $EMACS

sudo apt-get build-dep emacs24
./autogen.sh
./configure --prefix /usr/local/stow/$EMACS
make -j16
sudo make install
cd /usr/local/stow
sudo stow $EMACS

