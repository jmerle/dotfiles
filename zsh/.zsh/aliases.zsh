# Navigation
alias dl='cd ~/Downloads'
alias pr='cd ~/Projects'
alias dt='cd ~/Desktop'
alias dc='cd ~/Documents'
alias drive='cd ~/Drive'

# Package management
alias ai='sudo apt install'
alias as='sudo apt search'
alias au='sudo apt update'
alias auu='sudo apt update && sudo apt upgrade'

# Utilities
alias ls='ls -AFh --color=auto --group-directories-first'
alias ll='ls -l'
alias open='xdg-open'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias fopen='xdg-open "$(fzf)"'
alias fdc='git grep --line-number'
alias fdca='grep -rnw . -e'

# Git
alias git='hub'
alias g='git'
alias gac='git add -A && git commit -m'
alias gaa='git add -A && git commit --amend -C HEAD'

# Docker
alias d='docker'
alias dc='docker-compose'

# Ruby
alias b='bundle'
alias be='bundle exec'

# Drone
alias drone='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "`pwd`:/local" -e "DRONE_TOKEN=${DRONE_TOKEN}" -e "DRONE_SERVER=${DRONE_SERVER}" drone/cli'
