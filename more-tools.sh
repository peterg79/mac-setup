#!/bin/bash

xcode-select -p || xcode-select --install

type brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew doctor || exit

export HOMEBREW_NO_AUTO_UPDATE=1
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts
brew cask install font-source-code-pro

brew install tree
brew install vim

git clone https://github.com/amix/vimrc.git ~/git/amix/vimrc
sh ~/git/amix/vimrc/install_awesome_vimrc.sh

brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install betterzip
brew cask install webpquicklook
brew cask install suspicious-package
brew cask install java
brew cask install adoptopenjdk8

brew cask install https://raw.githubusercontent.com/caskroom/homebrew-cask/fda3b24db9052dcbffa84e40138e355e88343dab/Casks/1password.rb

brew cask install appcleaner
brew cask install caffeine
brew cask install cheatsheet
brew cask install docker
brew cask install doubletwist
brew cask install dropbox
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install google-hangouts
brew cask install flux
brew cask install rectangle
brew cask install sublime-text
brew cask install superduper
brew cask install transmission
brew cask install valentina-studio
brew cask install vlc
brew cask install visual-studio-code
brew cask install openwebstart
brew cask install pycharm
brew cask install intellij-idea
brew cask install itubedownloader
brew cask install tresorit
brew cask install vivaldi
brew cask install fanny
brew cask install steam
brew cask install skype
brew cask install plex
brew cask install iterm2
brew cask install google-backup-and-sync
brew cask install omnidisksweeper
brew cask install calibre
brew cask install kindle

brew install mas
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
