#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

VERSION=v0.12.9
NAME=node-$VERSION
TAR=$NAME-linux-x64.tar.gz

. ../common/require.sh

if ! has node; then
    cd /tmp
    if [ ! -d /tmp/$TAR ]; then
        wget https://nodejs.org/download/release/$VERSION/$TAR
    fi
    sudo mkdir -p /usr/local/stow/$NAME
    sudo tar --strip-components=1 -xf /tmp/$TAR -C /usr/local/stow/$NAME
    cd /usr/local/stow
    sudo stow $NAME
fi
