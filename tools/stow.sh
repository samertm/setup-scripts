#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

. ../common/require.sh
apt_require stow

# Install patch to disable warnings.
stow_path=$(which stow)
# Replace 'perl' with 'perl -X' on the first line.
sudo sed -i '1 s|#!/usr/bin/perl$|#!/usr/bin/perl -X|' ${stow_path}
