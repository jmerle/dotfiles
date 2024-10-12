#!/usr/bin/env bash

FILES=(
    ".gitconfig"
    ".gitignore-global"
    ".config/starship.toml"
    ".config/fish/config.fish"
    ".config/fish/fish_plugins"
)

for file in "${FILES[@]}"; do
    echo "Linking $file"

    src_path="$HOME/.dotfiles/src/$file"
    home_path="$HOME/$file"
    parent_dir=$(dirname "$home_path")

    rm -f "$home_path"
    mkdir -p "$parent_dir"
    ln -s "$src_path" "$home_path"
done
