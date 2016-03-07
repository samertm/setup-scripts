#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cd ~/src
git clone https://github.com/samertm/babushka
cd babushka
git checkout patch-1

mkdir -p ~/bin
ln -s ~/src/babushka/bin/babushka.rb ~/bin/babushka
