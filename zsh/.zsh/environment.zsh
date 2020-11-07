# Path variables
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$HOME/Applications:$HOME/.zsh/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

# Environment variables
export EDITOR='code'
export LANG=en_US.UTF-8
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# Add paths of common applications to PATH
command -v yarn &>/dev/null && export PATH="$PATH:$(yarn global bin)"
command -v inkdrop &>/dev/null && export PATH="$PATH:/usr/lib/inkdrop/resources/app/ipm/bin"
