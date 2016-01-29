#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

. ../common/require.sh
sh_require go

go get golang.org/x/tools/cmd/goimports
go get github.com/rogpeppe/godef
go get github.com/nsf/gocode
