#!/bin/bash

#Simple Functions. More complicated stuff should go in $CONFIG/bin

#Move to folder and list
#Usage: cdl /path/folder
#Keeping it in bashrc instead of ~/bin b/c bash creates subprocesses. 
function cdl { cd $1; ls -lahog;}

# Grep and kill
function psapp() {
  ps -ax | grep -i $1 | grep -i -v  "grep.-i.$1" | awk '{print $1}'
}

function killapp() {
  kill $(psapp $1)
}

# I don't use this yet.
# Figure this out later
myworkspace () {
    tmux new -s work -d
    tmux neww bash
    tmux neww -t 5 vim
    tmux neww -t 4 htop
    tmux split-window -h -t :4 top
    tmux attach -t work
}

