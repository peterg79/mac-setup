#!/bin/bash

source globals.sh

# Terminal
pkg_install brew iterm2 --cask

# VI Improved
pkg_install brew vim
# there's a .vimrc in this repository already, but this could be a good alternative
#git clone https://github.com/amix/vimrc.git ~/git/amix/vimrc
#sh ~/git/amix/vimrc/install_awesome_vimrc.sh

# Preview markdown files in a separate window. Markdown is formatted exactly the same as on GitHub.
pkg_install brew node
pkg_install npm vmd -g

# best font for coding: https://fonts.google.com/specimen/Source+Code+Pro
brew tap homebrew/cask-fonts
pkg_install brew font-source-code-pro --cask

# console tools
pkg_install brew gawk

# java versions
pkg_install brew adoptopenjdk8 --cask
pkg_install brew java --cask
pkg_install brew jenv

mkdir -p ~/.jenv/versions
for dir in `ls -1 /Library/Java/JavaVirtualMachines/`; do
    jenv add /Library/Java/JavaVirtualMachines/$dir/Contents/Home
done
jenv enable-plugin export

# java frameworks
pkg_install brew jetty jetty-runner
pkg_install brew maven

# IDE
pkg_install brew pycharm --cask
pkg_install brew intellij-idea --cask
pkg_install brew arduino --cask

# Network
pkg_install brew charles --cask

# Console utilities
pkg_install brew wget
