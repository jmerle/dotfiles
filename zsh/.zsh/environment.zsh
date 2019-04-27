# Path variables
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

# Environment variables
export EDITOR='code'
export LANG=en_US.UTF-8
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# Yarn
export PATH="$HOME/.yarn/bin:$PATH"

# Hub
export PATH="/opt/hub/bin:$PATH"

e () {
    "$EDITOR" "${1:-.}"
}

precmd () {
  window_title="\033]0;${PWD##*/}\007"
  echo -ne "$window_title"
}
