# Christian Delahousse's Shell Settings
# http://christian.delahousse.ca
# http://github.com/cdelahousse
# Last updated: 2015-07-31
# If ~/Dropbox does not exist, there should be a symbolic link that points to
# it. There should also be a symlink that points to $CONFIGD/.bin.

export EDITOR=vim
export DROPBOX=~/Dropbox
export CONFIGD=$DROPBOX/config
export BIN=~/.bin
export PATH=$PATH:$BIN
export TODO=$DROPBOX/textfiles/todo/todo.txt
export TEXTFILES=$DROPBOX/textfiles/

# Set terminal to 256 colors
export TERM='xterm-256color'

# F: exit if the output can fill the first screen
# i: makes less ignore case when searching for strings
# X: disables less from sending the termcap
export LESS='FiX'

# History
HISTSIZE=50000

# Keep these two branches in sync

if [ -n "$BASH_VERSION" ]; then
  HISTFILESIZE=500000
  HISTCONTROL='ignoredups:ignorespace'
  HISTIGNORE='ls:ll'
  HISTTIMEFORMAT='%F %T '

  shopt -s cdspell      # Ignore minor cd directory misspellings
  shopt -s checkwinsize # Update COLUMNS and LINES
  shopt -s cmdhist      # Lay multi line commands into one line of history
  shopt -s histappend   # Append to history
  shopt -s hostcomplete # Hostname completion
  shopt -s lithist

  if ((BASH_VERSINFO[0] >= 4)); then
    shopt -s checkjobs  # Warn about stopped jobs when exiting
    shopt -s dirspell   # Autocorrect paths during completion
  fi

  # After each command, append to the history file and reread it
  # http://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
  export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

elif [ -n "$ZSH_VERSION" ]; then
  SAVEHIST=500000
  export HISTFILE="${HISTFILE:-$HOME/.zsh_history}"

  setopt CORRECT          # Ignore minor cd directory misspellings
  setopt HIST_IGNORE_DUPS
  setopt HIST_IGNORE_SPACE
  setopt APPEND_HISTORY   # Append to history
  setopt EXTENDED_HISTORY # Keep timestamps in history
  setopt CHECK_JOBS       # Warn about stopped jobs when exiting
  setopt CORRECT_ALL      # Autocorrect paths during completion

  setopt INC_APPEND_HISTORY
  setopt SHARE_HISTORY
fi

if [ -n "$ZSH_VERSION" ]; then
  SCRIPT_PATH="${(%):-%N}"
else
  SCRIPT_PATH="${BASH_SOURCE[0]}"
fi

SHRCD="$(cd -- "$(dirname -- "$SCRIPT_PATH")" && pwd)"
source $SHRCD/aliases.sh
source $SHRCD/ps1.sh
source $SHRCD/mac.sh

# Put every local alias into the following file
LOCALALIASES=~/.local_aliases.sh
if [ -e $LOCALALIASES ]; then
  source $LOCALALIASES
fi
