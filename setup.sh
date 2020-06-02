#!/bin/bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

xcode-select -p || xcode-select --install

# ref: https://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile

function update_rc {
    # This is the place to put stuff that applies only to bash itself, such as
    # alias and function definitions, shell options, and prompt settings
    line=$1
    file=~/.bashrc
    grep -qxF "$line" $file || echo $line >> $file
}

function update_profile {
    # Applies to the whole session.
    # Put environment variable definitions here.
    line=$1
    file=~/.bash_profile
    grep -qxF "$line" $file || echo $line >> $file
}

update_profile "if [ -r ~/.profile ]; then . ~/.profile; fi"
update_profile "case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac"
update_profile "export CLICOLOR=1"
update_profile 'export PATH="/usr/local/bin:$PATH"'
update_profile 'export PATH="/usr/local/sbin:$PATH"'
update_profile 'export PATH="/usr/local/opt/openjdk/bin:$PATH"'
update_profile 'export PATH="~/bin:$PATH"'
update_rc 'export HISTSIZE=100000'
update_rc 'export HISTFILESIZE=100000'
update_rc 'shopt -s histappend'

source ~/.bash_profile

type brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew doctor || exit

export HOMEBREW_NO_AUTO_UPDATE=1

brew install git
brew list bash-completion && brew uninstall bash-completion
brew install bash-completion@2
update_rc'[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"'
cp -a .mac-prompt.bash ~/.mac-prompt.bash
update_rc '[[ -r "~/.mac-prompt.bash" ]] && . "~/.mac-prompt.bash"'

if [ ! -e ~/git/mathiasbynens/dotfiles/.git ]; then
    git clone https://github.com/mathiasbynens/dotfiles.git ~/git/mathiasbynens/dotfiles
else
    git -C ~/git/mathiasbynens/dotfiles checkout -- .macos
    git -C ~/git/mathiasbynens/dotfiles pull
fi
patch -d ~/git/mathiasbynens/dotfiles -p0 < .macos.patch || exit
patch -d ~/git/mathiasbynens/dotfiles -p0 < brew.sh.patch || exit


exit 0

source ~/git/mathiasbynens/dotfiles/.macos
source ~/git/mathiasbynens/dotfiles/brew.sh
brew uninstall openssh
hash -r
source more-tools.sh
source nativefier.sh
