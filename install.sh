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

# Install jq
if ! command -v jq &>/dev/null; then
    echo "Installing jq"
    sudo apt install -y jq
fi

# Install zplug
if [[ ! -d "$HOME/.zplug" ]]; then
    echo "Installing zplug"
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# Install a Git credential manager
if [[ ! -f /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret ]]; then
    echo "Installing Git credential manager"
    sudo apt install -y libsecret-1-0 libsecret-1-dev
    sudo make --directory=/usr/share/doc/git/contrib/credential/libsecret
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
    sudo apt install -y apt-transport-https ca-certificates software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt install -y docker-ce
    sudo groupadd docker
    sudo usermod -aG docker $USER
    needs_restart=1
fi

# Install Docker Compose
if ! command -v docker-compose &>/dev/null; then
    echo "Installing Docker Compose"
    docker_compose_url="$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq --raw-output '.assets[] | select(.name == "docker-compose-Linux-x86_64") | .browser_download_url')"
    sudo curl -sSL "$docker_compose_url" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

# Install Hub
if ! command -v hub &>/dev/null; then
    echo "Installing Hub"
    hub_url="$(curl -s https://api.github.com/repos/github/hub/releases/latest | jq --raw-output '.assets[] | select(.label | contains("Linux 64")) | .browser_download_url')"
    curl -sSL "$hub_url" -o /tmp/hub-linux.tgz
    mkdir -p /tmp/hub-linux
    tar -xvzf /tmp/hub-linux.tgz -C /tmp/hub-linux --strip 1 &>/dev/null
    sudo mv /tmp/hub-linux /opt/hub
    sudo cp /opt/hub/etc/hub.zsh_completion /usr/local/share/zsh/site-functions/_hub
    rm -rf /tmp/hub-linux.tgz /tmp/hub-linux
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
