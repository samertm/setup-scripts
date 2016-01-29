#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

. ../common/require.sh
sh_require go

go get -u golang.org/x/tools/cmd/goimports
go get -u github.com/rogpeppe/godef
go get -u github.com/nsf/gocode
