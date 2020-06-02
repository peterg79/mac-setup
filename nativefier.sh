#!/bin/bash

function install {
    pkgmanager=$1
    pkg=$2
    $pkgmanager list $pkg || $pkgmanager install $pkg
}


# install nativefier
brew update
export HOMEBREW_NO_AUTO_UPDATE=1
install brew trash
install brew ImageMagick
#install "brew cask" xquartz
#install "brew cask" wine-stable
install brew node
install npm "-g nativefier"

ICONS_LOCATION=~/git/peterg79/nativefier-icons
# update nativefier icons
if [ ! -e ~/git/peterg79/nativefier-icons/.git ]; then
    git clone git@github.com:peterg79/nativefier-icons.git ${ICONS_LOCATION}
    #git clone https://github.com/peterg79/nativefier-icons.git ${ICONS_LOCATION}
else
    git -C ${ICONS_LOCATION} pull
fi

GLOBAL_OPTIONS="--fast-quit --single-instance --darwin-dark-mode-support --internal-urls .\*?"


nativefier ${GLOBAL_OPTIONS} --name "Pluralsight Flow" --icon ${ICONS_LOCATION}/files/pluralsight.png http://yo/flowdemo
nativefier ${GLOBAL_OPTIONS} --name Evernote --icon ${ICONS_LOCATION}/files/evernote.png https://www.evernote.com/
nativefier ${GLOBAL_OPTIONS} --name "Google Mail" --icon ${ICONS_LOCATION}/files/gmail.png https://mail.google.com/
nativefier ${GLOBAL_OPTIONS} --name "Google Calendar" https://calendar.google.com/
nativefier ${GLOBAL_OPTIONS} --name Facebook https://facebook.com/
nativefier ${GLOBAL_OPTIONS} --name Messenger https://messenger.com/
nativefier ${GLOBAL_OPTIONS} --name Workday --icon ${ICONS_LOCATION}/files/workday.png https://wd5.myworkday.com/oath
nativefier ${GLOBAL_OPTIONS} --name Nest --icon ${ICONS_LOCATION}/files/nest3.png https://home.nest.com/
nativefier ${GLOBAL_OPTIONS} --name "Google Meet" https://meet.google.com/
nativefier ${GLOBAL_OPTIONS} --name "Google Drive" https://drive.google.com/

find . -name '*.app' -depth 2 -type d -print0 | while read -d $'\0' app
do
    appname=$(basename "$app")
    echo "'$appname'"
    trash "~/Applications/$appname"
    cp -a "$app" ~/Applications/
done
