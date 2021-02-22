# source /usr/local/etc/bash_completion.d/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=enabled
unset GIT_PS1_SHOWSTASHSTATE
unset GIT_PS1_SHOWUNTRACKEDFILES
unset GIT_PS1_SHOWUPSTREAM

# source /usr/local/etc/bash_completion.d/git-prompt.sh

if [ "$UID" = "0" ]; then
 USERCOLOR="\[\e[0;31m\]"
else
 USERCOLOR="\[\e[0;32m\]"
fi
ATCOLOR="\[\e[0;37m\]"
HOSTCOLOR="\[\e[0;33m\]"
DIRCOLOR="\[\e[0;36m\]"
NOCOLOR="\[\e[0;0m\]"
GITCOLOR="\[\e[0;34m\]"
REPOCOLOR="\[\e[0;91m\]"
YROOTCOLOR="\[\e[0;35m\]"

LHOSTNAME=$(hostname)

PS1="[${USERCOLOR}\u${ATCOLOR}@${HOSTCOLOR}\${LHOSTNAME%.*.com} ${DIRCOLOR}\w${GITCOLOR}\$(__git_ps1 \" git:(${REPOCOLOR}%s${GITCOLOR})\")${NOCOLOR}]${POSTFIX} "