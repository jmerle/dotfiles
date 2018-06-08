# Path variables
export PATH="./bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

# Environment variables
export EDITOR='code'
export LANG=en_US.UTF-8
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Install Ruby if it's not already installed
if rbenv version | grep "system" &>/dev/null; then
    echo "Installing Ruby 2.5.1 (this might take a while)"
    sudo apt-get install -y libssl-dev libreadline-dev
    rbenv install 2.5.1
    rbenv global 2.5.1
fi

# Install bundler if it's not already installed
if ! gem list | grep "bundler" &>/dev/null; then
    echo "Installing bundler"
    gem install bundler
fi

e () {
    exec "$EDITOR" "${1:-.}"
}
