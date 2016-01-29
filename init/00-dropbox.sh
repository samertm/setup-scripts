#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"
sudo apt-get update

. ../common/require.sh
apt_require python-gpgme dropbox

echo "Log into Dropbox."
