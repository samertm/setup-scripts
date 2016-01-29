#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

mkdir $HOME/src && true
mkdir $HOME/tmp && true
ln -s $HOME/Dropbox/org $HOME/org && true
