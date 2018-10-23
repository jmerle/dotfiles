# Navigation
alias dl='cd ~/Downloads'
alias pr='cd ~/Projects'
alias dt='cd ~/Desktop'
alias dc='cd ~/Documents'
alias mega='cd ~/Documents/MEGA'

# Package management
alias ai='sudo apt install'
alias as='sudo apt search'
alias au='sudo apt update'
alias auu='sudo apt update && sudo apt upgrade'

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

# Docker
alias d='docker'
alias dc='docker-compose'

# Web related
alias hosts='e /etc/hosts'

# Ruby
alias b='bundle'
alias be='bundle exec'

# Devilbox
alias db-start='cd /home/jasper/Projects/devilbox && docker-compose up -d && cd - 2>&1 >/dev/null'
alias db-stop='cd /home/jasper/Projects/devilbox && docker-compose stop && cd - 2>&1 >/dev/null'
alias db-shell='cd /home/jasper/Projects/devilbox && ./shell.sh && cd - 2>&1 >/dev/null'
