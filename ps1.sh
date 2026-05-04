if [ -n "${BASH_VERSION:-}" ]; then
  GREEN="\[\033[0;32m\]"
  RED="\[\033[0;31m\]"
  PINK="\[\033[0;35m\]"
  BLUE="\[\033[1;34m\]"
  CYAN="\[\033[1;36m\]"
  NO_COLOR="\[\033[0m\]"

  PS1='$([ $? -eq 0 ] && echo "'"$GREEN"'" || echo "'"$RED"'")'
  PS1+='\D{%m/%d %R} '
  PS1+="$PINK"'\u'"$NO_COLOR"
  PS1+='@'"$BLUE"'\h '
  PS1+="$CYAN"'\w'
  PS1+='\n'"$NO_COLOR"'\$ '

  export PS1
fi

if [ -n "${ZSH_VERSION:-}" ]; then
  PROMPT='%(?.%F{green}.%F{red})'
  PROMPT+='%D{%m/%d %H:%M} '
  PROMPT+='%F{magenta}%n%f'
  PROMPT+='@%F{blue}%m '
  PROMPT+='%F{cyan}%~'
  PROMPT+=$'\n%f%# '
fi
