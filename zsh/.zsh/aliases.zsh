# Navigation
alias dl='cd ~/Downloads'
alias pr='cd ~/Projects'
alias dt='cd ~/Desktop'
alias apps='cd ~/Applications'

# Utilities
alias ls='ls -AFh --color=auto --group-directories-first'
alias ll='ls -l'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias fopen='xdg-open "$(fzf)" &>/dev/null'

open () {
    xdg-open "${1:-.}" &>/dev/null
}

e () {
    "$EDITOR" "${1:-.}"
}

# Git
alias g='git'
alias gac='git add -A && git commit -m'
alias gaa='git add -A && git commit --amend -C HEAD'

gc () {
    gh repo clone "$1" "$2" -- --recurse-submodules
}

# Docker
alias d='docker'
alias dc='docker-compose'
alias dvps='docker-compose -H "ssh://jasper@$(dig +short jmerle.dev)"'
alias dcvps='docker-compose -H "ssh://jasper@$(dig +short jmerle.dev)"'

# Node.js
alias nvmu='nvm install --lts --reinstall-packages-from=current'

# Python
alias py='python'
alias ipy='ipython'

# SSH
alias vps='ssh "$(dig +short jmerle.dev)"'

# LaTeX
ltcp () {
    for file in "$@"
    do
        cp "/home/jasper/Projects/latex-templates/$file.sty" "$file.sty"
    done
}

# Lean
alias toolbox='docker run --volume "$(pwd)/data:/Lean/Data" --entrypoint dotnet quantconnect/lean QuantConnect.ToolBox.dll --destination-dir /Lean/Data'
