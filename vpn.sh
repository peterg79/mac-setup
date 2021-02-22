#!/bin/bash

source globals.sh

pkg_install brew xmlstarlet

sudo cp vpn-connect /usr/local/bin/
sudo cp vpn-disconnect /usr/local/bin/

