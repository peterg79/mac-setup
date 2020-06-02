#!/bin/bash

# ref: https://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile
rm -f ~/.bashrc
rm -f ~/.bash_profile
function update_rc {
    # This is the place to put stuff that applies only to bash itself, such as
    # alias and function definitions, shell options, and prompt settings
    line=$1
    file=~/.bashrc
    if [ ! -e $file ]; then touch $file; fi
    grep -qxF "$line" $file || echo $line >> $file
}

function update_profile {
    # Applies to the whole session.
    # Put environment variable definitions here.
    line=$1
    file=~/.bash_profile
    if [ ! -e $file ]; then touch $file; fi
    grep -qxF "$line" $file || echo $line >> $file
}

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
