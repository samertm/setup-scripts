#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker samer

echo 'follow these instructions: http://container-solutions.com/set-the-ip-of-the-docker-bridge-with-systemd/'
