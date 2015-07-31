#Mac Settings

if [[ `uname` == 'Darwin' ]]; then 
  echo 'Mac Mode';

  #colour codes for 'less'. For git diff.
  export LESS="-erX"

  PATH=$PATH:$HOME/.rvm/bin

  #Auto completion
  #http://blog.jeffterrace.com/2012/09/bash-completion-for-mac-os-x.html
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
  fi
fi;

