#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

. ../common/require.sh
apt_require silversearcher-ag tree
