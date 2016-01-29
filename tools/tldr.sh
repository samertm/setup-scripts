#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

. ../common/require.sh
sh_require node

npm install -g tldr
tldr --update
