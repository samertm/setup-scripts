#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Download 'hub'.
go get github.com/github/hub
