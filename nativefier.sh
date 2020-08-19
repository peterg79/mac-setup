#!/bin/bash

APPS_TO_INSTALL=$1

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
#GLOBAL_OPTIONS="--counter --bounce --show-menu-bar --fast-quit --single-instance --darwin-dark-mode-support --internal-urls google.com|okta.com|nest.com"
GLOBAL_OPTIONS="--counter --bounce --show-menu-bar --fast-quit --single-instance --darwin-dark-mode-support"

function create_app {
    # sometimes we need to lie about user agent: https://github.com/jiahaog/nativefier/issues/831
    user_agent="Mozilla/5.0 (Windows NT 10.0; rv:74.0) Gecko/20100101 Firefox/74.0"
    internal_urls="google.com|okta.com"
    local OPTIND o a
    while getopts ":n:u:i:a:d:" opt; do
        case $opt in
            n) name=$OPTARG ;;
            u) url=$OPTARG ;;
            i) icon=$OPTARG ;;
            a)
                 # sometimes we need to lie about user agent: https://github.com/jiahaog/nativefier/issues/831
                 user_agent=$OPTARG ;;
            d) internal_urls=$OPTARG ;;
            \?) echo "Invalid option: $OPTARG" 1>&2 ;;
            :) echo "Invalid option: $OPTARG requires an argument" 1>&2 ;;
        esac
    done
    shift $((OPTIND -1))
    global_options=${GLOBAL_OPTIONS}
    target_dir=apps
    mkdir -p $target_dir
    NAT_CMD="nativefier $global_options $options"
    [[ $name ]] || return 1
    [[ $url ]] || return 1
    [[ $icon ]] || return 1
    NAT_CMD="$NAT_CMD --name \"$name\" --icon ${ICONS_LOCATION}/files/$icon"
    [[ $user_agent ]] && NAT_CMD="$NAT_CMD --user-agent \"$user_agent\""
    [[ $internal_urls ]] && NAT_CMD="$NAT_CMD --internal-urls \"$internal_urls\""
    NAT_CMD="$NAT_CMD \"$url\" \"$target_dir\""

    if [ -z "$APPS_TO_INSTALL" -o "$APPS_TO_INSTALL" = "$name" -o "$APPS_TO_INSTALL" = "all" ]; then
        echo "$NAT_CMD"
        eval "$NAT_CMD"
    fi
}



create_app -n "Pluralsight Flow" -u http://yo/flowdemo -i pluralsight.png -d "google.com|okta.com|corp-apps.aws.oath.cloud"
create_app -n Evernote -u https://www.evernote.com/ -i evernote.png -d evernote.com
create_app -n "Google Mail" -u https://mail.google.com/ -i gmail.png -d google.com
create_app -n "Google Calendar" -u https://calendar.google.com/ -i google-calendar.png -d google.com
create_app -n "Google Meet" -u https://meet.google.com/ -i google-meet.png -d google.com
create_app -n "Google Drive" -u https://drive.google.com/ -i google-drive.png -d google.com
create_app -n "Google Maps" -u https://maps.google.com/ -i google-maps.png -d google.com
create_app -n Facebook -u https://facebook.com/ -i facebook.png -d facebook.com
create_app -n Messenger -u https://messenger.com/ -i messenger.png -d messenger.com
create_app -n Workday -u https://wd5.myworkday.com/vzbuilders -i workday.png -d "google.com|okta.com|myworkday.com"
create_app -n Nest -u https://home.nest.com/ -i nest3.png -d "google.com|nest.com"
create_app -n KidsNote -u https://www.kidsnote.com/home/ -i kidsnote.png -d kidsnote.com
create_app -n "Tiller Money" -u https://docs.google.com/spreadsheets/d/1uEMgWbnQN9AaBRr8Fkc86FPTj0ZSoCaawBtVhRZQBVE -i tiller-money.png -d google.com

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
