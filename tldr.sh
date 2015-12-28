#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

. require.sh
apt_require nodejs-legacy npm

npm install -g tldr
tldr --update
