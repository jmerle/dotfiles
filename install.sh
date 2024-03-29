#!/usr/bin/env bash

# Check for zsh
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "Install zsh and set it as default shell first"
    exit 1
fi

# Check for GNU Stow
if ! command -v stow &>/dev/null; then
    echo "Install GNU Stow first"
    exit 1
fi

# Check for Git
if ! command -v git &>/dev/null; then
    echo "Install Git first"
    exit 1
fi

# Check for curl
if ! command -v curl &>/dev/null; then
    echo "Install curl first"
    exit 1
fi

# Check for libsecret
if [[ ! -f /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret ]]; then
    echo "Install libsecret first"
    exit 1
fi

# Install zplug
if [[ ! -d "$HOME/.zplug" ]]; then
    echo "Installing zplug"
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# Stow all directories
for dir in */; do
    echo "Stowing ${dir::-1}"
    stow -D $dir
    stow $dir
done
