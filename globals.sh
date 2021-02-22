#!/bin/bash

# sourcing this file guarantees that xcode, homebrew, git are installed.

source functions.sh

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
if [ -z ${preset_osa+x} ]; then
  export preset_osa=1
  osascript -e 'tell application "System Preferences" to quit'
fi


if [ -z ${preset_sudo+x} ]; then
  export preset_sudo=1
  # Ask for the administrator password upfront
  sudo -v
  # Keep-alive: update existing `sudo` time stamp until `.macos` has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
fi

if [ -z ${preset_xcode+x} ]; then
  export preset_xcode=1
  xcode-select -p &>/dev/null || xcode-select --install
fi


if [ -z ${preset_brew+x} ]; then
  export preset_brew=1
  type brew &>/dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  # work around the pyenv config issue (https://github.com/pyenv/pyenv/issues/106)
  if type pyenv &>/dev/null; then
    PATH=${PATH//$(pyenv root)\/shims:/} brew doctor || exit
  fi
  export HOMEBREW_NO_AUTO_UPDATE=1
  # Save Homebrew’s installed location.
  export BREW_PREFIX=$(brew --prefix)
fi

pkg_install brew git
