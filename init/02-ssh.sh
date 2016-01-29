#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

ssh-keygen -t rsa -b 4096

. ../common/require.sh
apt_require xclip

echo "see ~/org/ssh.org for the websites you should add your new ssh key to."
