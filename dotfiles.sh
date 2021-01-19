#!/usr/bin/env bash

# vim colors:
# curl -o .vim/colors/solarized.vim https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim

cd "$(dirname "${BASH_SOURCE}")";

function doIt() {
	rsync \
		--exclude ".DS_Store" \
		-avh --no-perms dotfiles/ ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
