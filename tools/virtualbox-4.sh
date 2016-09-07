#!/bin/bash

wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

echo 'add "deb http://download.virtualbox.org/virtualbox/debian vivid contrib" to /etc/apt/sources.list'

