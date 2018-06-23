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

# Web related
alias apache-start='sudo systemctl start apache2 && apache-status'
alias apache-stop='sudo systemctl disable apache2 && apache-status'
alias apache-restart='sudo systemctl restart apache2 && apache-status'
alias apache-status='echo "Apache: $(sudo systemctl status apache2 | grep running &>/dev/null && echo "running" || echo "stopped")"'

alias mysql-start='sudo systemctl start mysql && mysql-status'
alias mysql-stop='sudo systemctl disable mysql && mysql-status'
alias mysql-restart='sudo systemctl restart mysql && mysql-status'
alias mysql-status='echo "MySQL: $(sudo systemctl status mysql | grep running &>/dev/null && echo "running" || echo "stopped")"'

alias web-start='apache-start && mysql-start'
alias web-stop='apache-stop && mysql-stop'
alias web-restart='apache-restart && mysql-restart'
alias web-status='apache-status && mysql-status'

alias vhosts='e /etc/apache2/vhosts.conf'
alias hosts='e /etc/hosts'
