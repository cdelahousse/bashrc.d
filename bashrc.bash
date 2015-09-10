#!/bin/bash

# Christian Delahousse's Bash Settings
# http://christian.delahousse.ca
# http://github.com/cdelahousse
# Last updated: 2015-07-31

#If ~/Dropbox does not exist, there should be a symbolic link that points to
#it. There should also be a symlink that points to $CONFIGD/.bin.

export EDITOR=vim
export DROPBOX=~/Dropbox
export CONFIGD=$DROPBOX/config
export BIN=~/.bin #TODO: Does this need to be a symlink?
export PATH=$PATH:$BIN
export TODO=$DROPBOX/textfiles/todo/todo.txt
export TEXTFILES=$DROPBOX/textfiles/

#Set terminal to 256 colors
export TERM='xterm-256color'

#F: exit if the output can fill the first screen
#i: makes less ignore case when searching for strings
#X: (the important one for this example) disables less from sending the termcap
export LESS='FiX'

HISTSIZE=50000
HISTFILESIZE=500000
HISTCONTROL='ignoredups:ignorespace'
HISTIGNORE='ls:ll'
# Keep the times of the commands in history
HISTTIMEFORMAT='%F %T '

shopt -s cdspell #Ignore minor cd directory misspellings
shopt -s checkwinsize #Update COLUMNS and LINES
shopt -s cmdhist #Lay multi line commands into one line of history
shopt -s cdspell #small typos can be ignored on directory change
shopt -s histappend #Append to history
shopt -s hostcomplete #Hostname completion
shopt -s lithist

if ((BASH_VERSINFO[0] >= 4)) ; then
  shopt -s checkjobs # Warn about stopped jobs when exiting
  shopt -s dirspell # Autocorrect paths during completion
fi

BASHRCD=~/.bashrc.d
source $BASHRCD/aliases.bash
source $BASHRCD/functions.bash
source $BASHRCD/ps1.bash
source $BASHRCD/mac.bash

#Put every local alias into the following file
LOCALALIASES=~/.local_aliases.bash 
if [ -e $LOCALALIASES ]; then
  source $LOCALALIASES
fi

