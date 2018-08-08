# nvm with lazy-loading
export NVM_LAZY_LOAD=true

# Powerlevel9k configuration
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status background_jobs time)
export POWERLEVEL9K_MODE='nerdfont-complete'

# Source zplug
source ~/.zplug/init.zsh

# Let zplug manage itself
zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "lukechilds/zsh-nvm"
zplug "cswl/zsh-rbenv"
zplug "docker/compose", use:contrib/completion/zsh
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug "djui/alias-tips"
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
    echo "Installing latest Node.js version"
    nvm install node
fi

# Ruby's rackup needs this
nvm alias default 10 &>/dev/null

# Install Ruby if it's not already installed
if rbenv version | grep "system" &>/dev/null; then
    echo "Installing Ruby 2.5.1 (this might take a while)"
    sudo apt install -y libssl-dev libreadline-dev
    rbenv install 2.5.1
    rbenv global 2.5.1
fi

# History substring search keybindings
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down
