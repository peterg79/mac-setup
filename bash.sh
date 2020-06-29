#!/bin/bash

source functions.sh

# ref: https://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile
rm -f ~/.bashrc
rm -f ~/.bash_profile

update_profile "echo running ~/.bash_profile"
update_profile "case \"\$-\" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac"
update_profile "export CLICOLOR=1"
update_profile 'export PATH="/usr/local/bin:$PATH"'
update_profile 'export PATH="/usr/local/sbin:$PATH"'
update_profile 'export PATH="/usr/local/opt/openjdk/bin:$PATH"'
update_profile 'export PATH="~/bin:$PATH"'
update_rc 'echo running ~/.bashrc'
update_rc 'export HISTSIZE=100000'
update_rc 'export HISTFILESIZE=100000'
update_rc 'shopt -s histappend'
update_rc '[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"'
update_rc '[[ -r ~/.mac-prompt.bash ]] && . ~/.mac-prompt.bash'

cp -a .mac-prompt.bash ~/.mac-prompt.bash

source ~/.bash_profile
