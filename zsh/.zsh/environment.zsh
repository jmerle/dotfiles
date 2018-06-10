# Path variables
export PATH="./bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

# Environment variables
export EDITOR='code'
export LANG=en_US.UTF-8
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# Yarn
export PATH="$HOME/.yarn/bin:$PATH"

e () {
    exec "$EDITOR" "${1:-.}"
}
