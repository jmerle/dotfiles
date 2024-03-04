# Path variables
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$HOME/Applications:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

# Environment variables
export EDITOR='code'
export LANG=en_US.UTF-8
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# Add binaries of common applications to PATH
command -v yarn &>/dev/null && export PATH="$PATH:$(yarn global bin)"
command -v inkdrop &>/dev/null && export PATH="$PATH:/usr/lib/inkdrop/resources/app/ipm/bin"

# Set terminal title
function preexec() {
  echo -n "\e]0;"
  echo -nE "${1:0:50}"
  print -nP " (%~)"
  echo -n "\a"
}
