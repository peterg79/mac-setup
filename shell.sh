#!/bin/bash

source globals.sh

pkg_install brew git
pkg_install brew bash
pkg_install brew bash-completion@2

# ref: https://superuser.com/questions/183870/difference-between-bashrc-and-bash-profile
rm -f ~/.bashrc
rm -f ~/.bash_profile
rm -f ~/.zshrc
cp -a .mac-prompt.bash ~/.mac-prompt.bash

#update_profile "echo running ~/.bash_profile"
update_profile "case \"\$-\" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac"
update_profile "export CLICOLOR=1"
update_profile 'export PATH="/usr/local/bin:$PATH"'
update_profile 'export PATH="/usr/local/sbin:$PATH"'
update_profile 'export PATH="/usr/local/opt/openjdk/bin:$PATH"'
update_profile 'export PATH="~/bin:$PATH"'

#update_rc 'echo running ~/.bashrc'
update_rc 'export HISTSIZE=100000'
update_rc 'export HISTFILESIZE=100000'
update_rc 'shopt -s histappend'
update_rc '[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"'
update_rc '[[ -r ~/.mac-prompt.bash ]] && . ~/.mac-prompt.bash'
update_zshrc "source /usr/local/etc/bash_completion.d/git-prompt.sh"
update_zshrc "setopt PROMPT_SUBST ; PS1='[%n@%m %c\$(__git_ps1 \" (%s)\")]\\$ '"

#update_profile '[[ $JENV_LOADED ]] || eval "$(jenv init -)"'

curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells
  chsh -s "${BREW_PREFIX}/bin/bash"
fi

source ~/.bash_profile
