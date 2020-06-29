#!/bin/bash

function update_rc {
    # This is the place to put stuff that applies only to bash itself, such as
    # alias and function definitions, shell options, and prompt settings
    line=$1
    file=~/.bashrc
    if [ ! -e $file ]; then touch $file; fi
    grep -qxF "$line" $file || echo $line >> $file
}

function update_profile {
    # Applies to the whole session.
    # Put environment variable definitions here.
    line=$1
    file=~/.bash_profile
    if [ ! -e $file ]; then touch $file; fi
    grep -qxF "$line" $file || echo $line >> $file
}

function pkg_install {
     pkgmanager=$1
     pkg=$(echo $2 | tr '[:upper:]' '[:lower:]')
     install_options=$3
     [[ $pkgmanager = brew ]] && [[ -e /usr/local/Cellar/$pkg ]] && return
     $pkgmanager list $install_options $pkg || $pkgmanager install $install_options $pkg
 }
