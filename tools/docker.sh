#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker samer
