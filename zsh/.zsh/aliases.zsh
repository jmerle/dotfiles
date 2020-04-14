# Navigation
alias dl='cd ~/Downloads'
alias pr='cd ~/Projects'
alias dt='cd ~/Desktop'
alias drive='cd ~/Drive'
alias teams='cd ~/Teams'
alias apps='cd ~/Applications'

# Utilities
alias ls='ls -AFh --color=auto --group-directories-first'
alias ll='ls -l'
alias open='xdg-open'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias fopen='xdg-open "$(fzf)"'

# Git
alias git='hub'
alias g='git'
alias gac='git add -A && git commit -m'
alias gaa='git add -A && git commit --amend -C HEAD'

# Docker
alias d='docker'
alias dc='docker-compose'

# Python
alias py='python'
