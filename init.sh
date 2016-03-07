#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

./install_babushka.sh
mkdir -p ~/.babushka
ln -s `pwd`/babushka-deps ~/.babushka/deps
