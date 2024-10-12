set fish_greeting

set -x EDITOR "code"
set -x LANG "en_US.UTF-8"
set -x LSCOLORS "exfxcxdxbxegedabagacad"

alias dl="cd ~/Downloads"
alias pr="cd ~/Projects"
alias dt="cd ~/Desktop"
alias apps="cd ~/Applications"

alias ls="ls -AFh --color=auto --group-directories-first"
alias ll="ls -l"

alias g="git"
alias gac="git add -A && git commit -m"
alias gaa="git add -A && git commit --amend -C HEAD"

alias d="docker"
alias dc="docker compose"

alias py="python"
alias ipy="ipython"
alias act="source .venv/bin/activate.fish"

function o -d "Open a path in the default application"
    xdg-open $argv &>/dev/null
end

function e -d "Open a path in the default editor VS Code"
    "$EDITOR" $argv &>/dev/null
end

function gc -d "Clone a GitHub repository and its submodules with the GitHub CLI"
    gh repo clone $argv -- --recurse-submodules
end

starship init fish | source

if test -f ~/.local.fish
    source ~/.local.fish
end
