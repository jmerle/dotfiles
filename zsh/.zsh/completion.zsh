fpath=(~/.zsh/completions $fpath)

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

autoload -U compinit
compinit
