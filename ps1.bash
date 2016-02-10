#!/bin/bash

#Colours
BLUE="\[\033[1;34m\]"
CYAN="\[\033[1;36m\]"
GRAY="\[\033[0;37m\]"
NO_COLOR="\[\033[0m\]"
PINK="\[\e[0;35m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"

#start with an empty line
PS1=""
#Choose a color based on whether the last command succeeded or not
PS1="$PS1"'$([[ ${?:-0} -eq 0 ]] && echo "\033[0;32m" || echo "\033[0;31m")'
#add the time, date, user@host and full path
PS1="$PS1\D{%m/%d %R} $PINK\u$NO_COLOR@$BLUE\h $CYAN\w"
PS1="$PS1\n$NO_COLOR\$ "
export PS1

