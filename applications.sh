#!/bin/bash

source globals.sh

# Password manager: 1Password (version 6 before the subscription model)
# Bitwarden would be a good alternative, after this feature:
# https://community.bitwarden.com/t/add-more-pre-defined-item-types/228
brew tap homebrew/cask-versions

exit 0
pkg_install brew 1password6 --cask

# Just hold the ⌘-Key a bit longer to get a list of all active short cuts of the current application
pkg_install brew cheatsheet --cask

# Network drives
pkg_install brew dropbox --cask
pkg_install brew nextcloud --cask
pkg_install brew tresorit --cask
#pkg_install brew box-drive --cask

# SuperDuper is the most advanced, yet easy to use disk copying program available for macOS.
pkg_install brew superduper --cask

# Transmission is a cross-platform BitTorrent client
pkg_install brew transmission --cask

# Browsers
pkg_install brew google-chrome --cask
pkg_install brew google-chrome-canary --cask
pkg_install brew vivaldi --cask

# Offline browsers
pkg_install brew sitesucker-pro --cask
pkg_install brew itubedownloader --cask

# Text editors
pkg_install brew visual-studio-code --cask
#pkg_install brew sublime-text --cask

# Media players/rippers
pkg_install brew vlc --cask
pkg_install brew plex --cask
pkg_install brew freac --cask

# Communication
pkg_install brew skype --cask
pkg_install brew signal --cask
pkg_install brew zoom --cask

# Database client
#pkg_install brew valentina-studio --cask

# Games
pkg_install brew steam --cask

# Ebooks
pkg_install brew calibre --cask
pkg_install brew kindle --cask

# Hardware management (disk, battery, fans)
pkg_install brew omnidisksweeper --cask
pkg_install brew coconutbattery --cask
pkg_install brew fanny --cask

# Virtualization
pkg_install brew docker --cask
pkg_install brew vmware-fusion --cask

# Apps from the App Store
# find ID using this command: mas search 'Evernote Web Clipper'
pkg_install brew mas

# Numbers
mas install 409203825
# Pages
mas install 409201541
# Keynote
mas install 409183694
# Slack
mas install 803453959
# Parcel
mas install 639968404
# Evernote Web Clipper
mas install 1481669779
# Microsoft Remote Desktop
mas install 1295203466
# WhatsApp Desktop
mas install 1147396723
# MQTT Explorer
mas install 1455214828
# Pixelmator
mas install 407963104
# Whiteboard  Easy and Smart
mas install 496465537
# Facebook Messenger
mas install 1480068668
# Kiwi for GMail lite
mas install 1006184923

function attic {
sudo cp vpn-connect /usr/local/bin/

pkg_install brew appcleaner --cask
pkg_install brew caffeine --cask
pkg_install brew cheatsheet --cask
pkg_install brew docker --cask
pkg_install brew doubletwist --cask
pkg_install brew google-hangouts --cask
pkg_install brew flux --cask
pkg_install brew rectangle --cask
pkg_install brew sublime-text --cask
pkg_install brew superduper --cask
pkg_install brew carbon-copy-cloner --cask
pkg_install brew transmission --cask
pkg_install brew valentina-studio --cask
pkg_install brew openwebstart --cask
pkg_install brew google-backup-and-sync --cask
}
