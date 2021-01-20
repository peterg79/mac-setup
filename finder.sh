#!/bin/bash

source globals.sh

# A simple CLI tool for Finder sidebar modification.
pkg_install brew mysides --cask

mysides remove ${USER} file://${HOME}
mysides add ${USER} file://${HOME}
mkdir -p ${HOME}/Screenshots
mysides remove Screenshots file://${HOME}/Screenshots
mysides add Screenshots file://${HOME}/Screenshots

