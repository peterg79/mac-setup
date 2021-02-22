#!/bin/bash

source globals.sh

# A simple CLI tool for Finder sidebar modification.
pkg_install brew mysides --cask

function add_sidebar() {
    link_name=$1
    target=$2
    if [ ! -e $target ]; then
        mkdir -p $target
    fi
    mysides remove "$link_name" "$target"
    mysides add "$link_name" "$target"
}

add_sidebar ${USER} file://${HOME}
add_sidebar Applications file:///Applications
add_sidebar "My Applications" file://${HOME}/Applications

# add Tresors Google Drive
for dir in Desktop Downloads Documents Nextcloud Dropbox Screenshots Movies Music Pictures; do
    add_sidebar $dir file://${HOME}/$dir
done
