# Navigation
alias dl='cd ~/Downloads'
alias pr='cd ~/Projects'
alias dt='cd ~/Desktop'
alias dc='cd ~/Documents'
alias mega='cd ~/Documents/MEGA'

# Package management
alias ai='sudo apt-get install'
alias as='sudo apt-cache search'
alias au='sudo apt-get update'
alias auu='sudo apt-get update && sudo apt-get upgrade'

# Utilities
alias reload='. ~/.zshrc'
alias ll='ls -l'
alias open='xdg-open'
alias cls='clear'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias fopen='xdg-open "$(fzf)"'

# Git
alias g='git'
alias gac='git add -A && git commit -m'
alias gaa='git add -A && git commit --amend -C HEAD'

# PHP
alias art='php artisan'
alias c='composer'
alias xdebug-enable='sudo phpenmod xdebug'
alias xdebug-disable='sudo phpdismod xdebug'

# Docker
alias d='docker'
alias dc='docker-compose'

# Web related
alias hosts='e /etc/hosts'

# Ruby
alias b='bundle'
alias be='bundle exec'
