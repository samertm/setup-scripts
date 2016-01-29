#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

. ../common/require.sh
sh_require go

# Download 'hub'.
go get github.com/github/hub
