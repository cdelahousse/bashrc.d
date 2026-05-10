if [ -n "${BASH_VERSION:-}" ]; then
  GREEN="\[\033[0;32m\]"
  RED="\[\033[0;31m\]"
  PINK="\[\033[0;35m\]"
  BLUE="\[\033[1;34m\]"
  CYAN="\[\033[1;36m\]"
  YELLOW="\[\033[0;33m\]"
  NO_COLOR="\[\033[0m\]"

  parse_git_branch() {
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return

    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    [ -n "$branch" ] && printf " (%s)" "$branch"
  }

  PS1='$([ $? -eq 0 ] && echo "'"$GREEN"'" || echo "'"$RED"'")'
  PS1+='\D{%m/%d %R} '

  # Only show user@hostname during SSH connection
  if [ -n "${SSH_CONNECTION:-}" ]; then
    PS1+="$PINK"'\u'"$NO_COLOR"'@'"$BLUE"'\h '"$NO_COLOR"
  fi

  PS1+="$YELLOW"'$(parse_git_branch) '
  PS1+="$CYAN"'\w'
  PS1+='\n'"$NO_COLOR"'\$ '

  export PS1
fi

if [ -n "${ZSH_VERSION:-}" ]; then

  setopt PROMPT_SUBST

  git_branch() {
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return

    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    [ -n "$branch" ] && printf " (%s)" "$branch"
  }

  PROMPT='%(?.%F{green}.%F{red})'
  PROMPT+='%D{%m/%d %H:%M} '

  # Only show user@hostname during SSH connection
  if [ -n "${SSH_CONNECTION:-}" ]; then
    PROMPT+='%F{magenta}%n%f@%F{blue}%m%f '
  fi

  PROMPT+='$(git_branch) '
  PROMPT+='%F{cyan}%~'
  PROMPT+=$'\n%f%# '
fi
