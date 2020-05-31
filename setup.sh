#!/bin/bash



rm -rf ~/git/mathiasbynens
mkdir -p ~/git/mathiasbynens
git clone https://github.com/mathiasbynens/dotfiles.git ~/git/mathiasbynens/dotfiles
cp .macos.patch ~/git/mathiasbynens/dotfiles/
pushd ~/git/mathiasbynens/dotfiles/
patch -p0 < .macos.patch
popd

source ~/git/mathiasbynens/dotfiles/.macos
source ~/git/mathiasbynens/dotfiles/brew.sh
source more-tools.sh
