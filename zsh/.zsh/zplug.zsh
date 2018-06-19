# nvm with lazy-loading
export NVM_LAZY_LOAD=true

# Source zplug
source ~/.zplug/init.zsh

# Let zplug manage itself
zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "lukechilds/zsh-nvm"
zplug "peco/peco", as:command, from:gh-r
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug "djui/alias-tips"
zplug "paulirish/git-open", as:plugin
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Prompt theme
zplug "denysdovhan/spaceship-prompt", use:"spaceship.zsh", from:github, as:theme

# Install plugins which are not yet installed
if ! zplug check; then
    zplug install
fi

# Load all plugins
zplug load >/dev/null

# Install Node.js if it's not already installed
if [[ ! -d "$NVM_DIR/versions" ]]; then
    echo "Installing latest Node.js version"
    nvm install node
fi

# History substring search keybindings
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down
