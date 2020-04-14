# Path variables
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

# Environment variables
export EDITOR='code'
export LANG=en_US.UTF-8
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# Open file or directory in editor
e () {
    "$EDITOR" "${1:-.}"
}
