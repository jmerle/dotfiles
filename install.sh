#!/bin/bash

zsh_installed=1

# Install build-essential
if ! dpkg -s build-essential &>/dev/null; then
    echo "Installing build-essential"
    sudo apt-get install -y build-essential
fi

# Install zsh
if ! command -v zsh &>/dev/null; then
    echo "Installing zsh"
    zsh_installed=0
    sudo apt-get install -y zsh
    chsh -s $(which zsh)
fi

# Install GNU Stow
if ! command -v stow &>/dev/null; then
    echo "Installing stow"
    sudo apt-get install -y stow
fi

# Install curl
if ! command -v curl &>/dev/null; then
    echo "Installing curl"
    sudo apt-get install -y curl
fi

# Install zplug
if [[ ! -d "$HOME/.zplug" ]]; then
    echo "Installing zplug"
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# Install a Git credential manager
if [[ ! -f /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret ]]; then
    echo "Installing Git credential manager"
    sudo apt-get install -y libsecret-1-0 libsecret-1-dev
    sudo make --directory=/usr/share/doc/git/contrib/credential/libsecret
fi

# Install Yarn
if ! command -v yarn &>/dev/null; then
    echo "Installing Yarn"

    # Configure the repository
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

    # Install Yarn without installing Node.js, NVM installs Node.js
    sudo apt-get update
    sudo apt-get install --no-install-recommends yarn
fi

# Install rbenv
if [[ ! -d "$HOME/.rbenv" ]]; then
    echo "Installing rbenv"
    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
fi

# Install SDKMAN
if [[ ! -d "$HOME/.sdkman" ]]; then
    echo "Installing SDKMAN"
    curl -s "https://get.sdkman.io" | bash
fi

# Stow stow/
echo "Stowing stow"
stow -D stow
stow stow

# Stow all directories except stow/
for dir in */; do
    if [[ $dir != "stow/" ]]; then
        echo "Stowing ${dir::-1}"
        stow -D $dir
        stow $dir
    fi
done

# All done, final message depends on whether zsh has just been installed or not
if [ "$zsh_installed" -eq "0" ]; then
    echo "Restart the machine to get access to the newest goodies."
else
    echo "Exit this shell and start a new one to get access to the newest goodies."
fi
