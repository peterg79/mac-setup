#!/bin/bash

source functions.sh

# install nativefier
[[ $HOMEBREW_NO_AUTO_UPDATE -ne 1 ]] && brew update
export HOMEBREW_NO_AUTO_UPDATE=1
pkg_install brew trash
pkg_install brew ImageMagick
#pkg_install "brew cask" xquartz
#pkg_install "brew cask" wine-stable
pkg_install brew node
pkg_install npm nativefier -g

ICONS_LOCATION=~/git/peterg79/nativefier-icons
# update nativefier icons
if [ ! -e ~/git/peterg79/nativefier-icons/.git ]; then
    git clone git@github.com:peterg79/nativefier-icons.git ${ICONS_LOCATION}
    #git clone https://github.com/peterg79/nativefier-icons.git ${ICONS_LOCATION}
else
    git -C ${ICONS_LOCATION} pull
fi

#GLOBAL_OPTIONS="--counter --bounce --show-menu-bar --fast-quit --single-instance --darwin-dark-mode-support --internal-urls .\*?"
GLOBAL_OPTIONS="--counter --bounce --show-menu-bar --fast-quit --single-instance --darwin-dark-mode-support --internal-urls google.com|okta.com|nest.com"

function create_app {
    name=$1
    url=$2
    icon=$3
    user_agent=$4
    global_options=${GLOBAL_OPTIONS}
    target_dir=apps
    mkdir -p $target_dir
    if [ "$user_agent" ]; then
        nativefier $global_options $options \
            --user-agent "$user_agent" \
            --name "$name" \
            --icon "${ICONS_LOCATION}/files/$icon" \
            "$url" \
            "$target_dir"
    else
        nativefier $global_options $options \
            --name "$name" \
            --icon "${ICONS_LOCATION}/files/$icon" \
            "$url" \
            "$target_dir"
    fi
}

create_app "Pluralsight Flow" http://yo/flowdemo pluralsight.png
create_app Evernote https://www.evernote.com/ evernote.png
create_app "Google Mail" https://mail.google.com/ gmail.png
create_app "Google Calendar" https://calendar.google.com/ google-calendar.png
create_app "Google Meet" https://meet.google.com/ google-meet.png
create_app "Google Drive" https://drive.google.com/ google-drive.png
# sometimes we need to lie about user agent: https://github.com/jiahaog/nativefier/issues/831
create_app "Google Maps" https://maps.google.com/ google-maps.png "Mozilla/5.0 (Windows NT 10.0; rv:74.0) Gecko/20100101 Firefox/74.0"
create_app Facebook https://facebook.com/ facebook.png
create_app Messenger https://messenger.com/ messenger.png
create_app Workday https://wd5.myworkday.com/oath workday.png
create_app Nest https://home.nest.com/ nest3.png "Mozilla/5.0 (Windows NT 10.0; rv:74.0) Gecko/20100101 Firefox/74.0"
create_app KidsNote https://www.kidsnote.com/home/ kidsnote.png
create_app "Tiller Money" https://docs.google.com/spreadsheets/d/1uEMgWbnQN9AaBRr8Fkc86FPTj0ZSoCaawBtVhRZQBVE tiller-money.png "Mozilla/5.0 (Windows NT 10.0; rv:74.0) Gecko/20100101 Firefox/74.0"

# DRM-protected content won't play: https://github.com/jiahaog/nativefier/issues/435
# create_app Netflix https://www.netflix.com/ netflix.png

APP_LOCATION=~/Applications
find apps -name '*.app' -depth 2 -type d -print0 | while read -d $'\0' app
do
    appname=$(basename "$app")
    echo "'$appname'"
    [[ -e ${APP_LOCATION}/$appname ]] && trash "${APP_LOCATION}/$appname"
    cp -a "$app" "${APP_LOCATION}/"
done
