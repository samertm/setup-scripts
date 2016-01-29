#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

. ../common/require.sh
sh_require go

# Download 'hub'.
go get -u github.com/github/hub
