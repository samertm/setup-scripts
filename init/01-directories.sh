#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

mkdir $HOME/src && true
mkdir $HOME/tmp && true
mkdir $HOME/bin && true
ln -s $HOME/Dropbox/org $HOME/org && true
