#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Setup Go.

version="go1.5.2"
link="https://storage.googleapis.com/golang/${version}.linux-amd64.tar.gz"
tmpname="/tmp/${version}.tar.gz"
tmpout="/tmp/go"
out="$HOME/go"

rm -rf ${tmpname} ${tmpout} ${out} # Remove all destinations, if they exist.
curl ${link} > ${tmpname}
tar -xf ${tmpname} -C "/tmp" # Extracts to /tmp/go.
mv ${tmpout} ${out}
