
#Mac Settings

if [ "$(uname)" = "Darwin" ]; then
  echo 'Mac Mode';

  #colour codes for 'less'. For git diff.
  export LESS="-iXFR"


  # Bash completion from Homebrew
  if command -v brew >/dev/null 2>&1; then
    BREW_PREFIX="$(brew --prefix)"

    if [ -r "$BREW_PREFIX/etc/bash_completion" ]; then
      source "$BREW_PREFIX/etc/bash_completion"
    fi

    if [ -r "$BREW_PREFIX/etc/profile.d/bash_completion.sh" ]; then
      source "$BREW_PREFIX/etc/profile.d/bash_completion.sh"
    fi
  fi

  # MacOS has different versions of GNU coreutils which conflict with other
  # aliases I set elsewhere in these config files
  unalias mv 2>/dev/null
  unalias cp 2>/dev/null
fi;

