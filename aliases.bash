#Aliases go here
alias la='ls -AF' #list all
alias ll='ls -alhF' #list all long
alias l='ls -CF' #List
alias mc='make clean'
alias sim="sudo vim" 

# makes a backup of source when the force and backup options are given and source
# and dest are the same name for an existing, regular file
alias cp='cp --backup=numbered'
alias ln='ln --backup=numbered'
alias mv='mv -f --backup=numbered'

#Git
alias grd='git rm $(git ls-files --deleted)'
alias gamend='git commit --amend -C HEAD'

#Shortcuts to folders
alias db="cd \"$DROPBOX\""
alias proggy='cd ~/Dropbox/programming/'
alias cmr='cd ~/clearmereg'
alias uninotes='cd ~/Dropbox/uninotes'

#Random Apps
alias mywget='wget --mirror --page-requisites --adjust-extension --no-parent --wait=2 --convert-links'
alias locoserv='ssh cd@zaphod.local -p 1984'
alias chromeproxy='chromium-browser --proxy-server=socks://127.0.0.1:8080'
alias textfiles="vim \"$DROPBOX/textfiles/\""
alias journal='vim -c "cd ~/Dropbox/journal/"'
alias todo="vim "$TODO 

alias sysupd='sudo apt-get update -y && sudo apt-get dist-upgrade -y'
alias webserv='echo Port 8000;python -m SimpleHTTPServer 8000'
alias webserv2='echo port 9000;python -m SimpleHTTPServer 9000'
alias psme='ps aux | grep '"$(whoami)"

# Make terminal beep
alias beep="echo -e \"\a\""

# Go up directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
