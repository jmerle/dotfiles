# Navigation
alias dl='cd ~/Downloads'
alias pr='cd ~/Projects'
alias dt='cd ~/Desktop'
alias dc='cd ~/Documents'
alias drive='cd ~/Drive'

# Package management
alias pk='pkcon'
alias pki='pkcon install'
alias pks='pkcon search'
alias pkr='pkcon refresh'
alias pkru='pkcon refresh && pkcon update'

# Utilities
alias ls='ls -AFh --color=auto --group-directories-first'
alias ll='ls -l'
alias open='xdg-open'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias fopen='xdg-open "$(fzf)"'
alias fdc='git grep --line-number'
alias fdca='grep -rnw . -e'
alias localip='hostname -I | cut -d" " -f1'
alias remoteip='curl -w "\n" ifconfig.me'

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

# DevDocs
alias ddadd='git add -A && git reset -- public/docs/docs.json'
