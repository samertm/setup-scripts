#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cd ~/src
git clone --depth=1 https://github.com/benhoskings/babushka
cd babushka

mkdir -p ~/bin
ln -s ~/src/babushka/bin/babushka.rb ~/bin/babushka
