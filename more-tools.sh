#!/bin/bash

xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo 'PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

brew tap homebrew/cask-fonts
brew cask install font-source-code-pro

mkdir ~/.bash_profile.d
echo "export CLICOLOR=1" > ~/.bash_profile.d/clicolor

brew install tree \
    bash-completion \
    vim

echo "[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion" > ~/.bash_profile.d/bash-completion

git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

brew tap homebrew/cask-versions

brew cask install \
    qlcolorcode \
    qlstephen \
    qlmarkdown \
    quicklook-json \
    qlprettypatch \
    quicklook-csv \
    betterzip \
    webpquicklook \
    suspicious-package \
    java \
    adoptopenjdk8 \


echo 'export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"' > ~/.bash_profile.d/java8

brew cask install https://raw.githubusercontent.com/caskroom/homebrew-cask/fda3b24db9052dcbffa84e40138e355e88343dab/Casks/1password.rb

brew cask install \
    alfred \
    appcleaner \
    caffeine \
    cheatsheet \
    docker \
    doubletwist \
    dropbox \
    google-chrome \
    google-hangouts \
    flux \
    rectangle \
    sublime-text \
    superduper \
    transmission \
    valentina-studio \
    vlc \
    visual-studio-code \
    openwebstart \
    pycharm \
    intellij-idea \
    itubedownloader \
    tresorit \
    vivaldi \
    fanny \
    steam \
    skype \
    plex \
    iterm2 \
    google-backup-and-sync \

brew cask install font-source-code-pro


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


brew install node
npm install nativefier
