# Powerlevel9k configuration
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir virtualenv vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs time)
export POWERLEVEL9K_MODE="nerdfont-complete"

# fzf configuration
export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore -l ""'

# Source zplug
source ~/.zplug/init.zsh

# Let zplug manage itself
zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "lukechilds/zsh-nvm"
zplug "zdharma/zsh-diff-so-fancy"
zplug "docker/compose", use:contrib/completion/zsh
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug "BurntSushi/ripgrep", from:gh-r, as:command, rename-to:rg
zplug "lib/completion", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Prompt theme
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# Install plugins which are not yet installed
if ! zplug check; then
    zplug install
fi

# Load all plugins
zplug load >/dev/null

# Install Node.js if it's not already installed
if [[ ! -d "$NVM_DIR/versions" ]]; then
    echo "Installing latest LTS version of Node.js"
    nvm install --lts
fi

# History substring search keybindings
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down
