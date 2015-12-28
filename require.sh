#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

function apt_require {
    sudo apt-get install -y $*
}

function sh_require {
    IFS=$' \n\t'
    for r in $*; do
        ./$r.sh
    done
    IFS=$'\n\t'
}
