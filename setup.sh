#!/bin/bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

xcode-select -p || xcode-select --install

type brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# work around the pyenv config issue (https://github.com/pyenv/pyenv/issues/106)
PATH=${PATH//$(pyenv root)\/shims:/} brew doctor || exit

export HOMEBREW_NO_AUTO_UPDATE=1

[[ -e /usr/local/bin/git ]] || brew install git
if [ ! -e /usr/local/Cellar/bash-completion@2 ]; then
    [[ -e /usr/local/Cellar/bash-completion ]] && brew uninstall bash-completion
    brew install bash-completion@2
fi

source bash.sh

if [ ! -e ~/git/mathiasbynens/dotfiles/.git ]; then
    git clone https://github.com/mathiasbynens/dotfiles.git ~/git/mathiasbynens/dotfiles
else
    git -C ~/git/mathiasbynens/dotfiles checkout -- .macos brew.sh
    git -C ~/git/mathiasbynens/dotfiles pull
fi
patch -d ~/git/mathiasbynens/dotfiles -p1 < .macos.patch || exit
patch -d ~/git/mathiasbynens/dotfiles -p1 < brew.sh.patch || exit


source ~/git/mathiasbynens/dotfiles/.macos
source ~/git/mathiasbynens/dotfiles/brew.sh
brew uninstall openssh
hash -r
source python.sh
source more-tools.sh
source nativefier.sh

curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
