#!/bin/bash

needs_restart=0

# Install build-essential
if ! dpkg -s build-essential &>/dev/null; then
    echo "Installing build-essential"
    sudo apt install -y build-essential
fi

# Install zsh
if ! command -v zsh &>/dev/null; then
    echo "Installing zsh"
    needs_restart=1
    sudo apt install -y zsh
    chsh -s $(which zsh)
fi

# Install GNU Stow
if ! command -v stow &>/dev/null; then
    echo "Installing stow"
    sudo apt install -y stow
fi

# Install curl
if ! command -v curl &>/dev/null; then
    echo "Installing curl"
    sudo apt install -y curl
fi

# Install zplug
if [[ ! -d "$HOME/.zplug" ]]; then
    echo "Installing zplug"
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# Install Node.js
if ! command -v node &>/dev/null; then
    echo "Installing Node.js"
    wget -qO- https://deb.nodesource.com/setup_10.x | sudo -E bash -
    sudo apt install -y nodejs
fi

# Install Yarn
if ! command -v yarn &>/dev/null; then
    echo "Installing Yarn"

    # Configure the repository
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

    # Install Yarn without installing Node.js
    sudo apt remove cmdtest
    sudo apt update
    sudo apt install --no-install-recommends yarn
fi

# Install Docker
if ! command -v docker &>/dev/null; then
    echo "Installing Docker"
    sudo apt install apt-transport-https ca-certificates software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu$(lsb_release -cs)stable"
    sudo apt install docker-ce
    sudo groupadd docker
    sudo usermod -aG docker $USER
    needs_restart=1
fi

# Stow all directories
for dir in */; do
    echo "Stowing ${dir::-1}"
    stow -D $dir
    stow $dir
done

# Install SDKMAN
if [[ ! -d "$HOME/.sdkman" ]]; then
    echo "Installing SDKMAN"
    curl -s "https://get.sdkman.io" | bash
fi

# All done, final message depends on whether zsh has just been installed or not
if [ "$needs_restart" -eq "1" ]; then
    echo "Restart the machine to get access to the newest goodies."
else
    echo "Exit this shell and start a new one to get access to the newest goodies."
fi
