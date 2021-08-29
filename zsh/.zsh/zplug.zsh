# Custom Powerlevel9k segment for Miniconda which only appears if a non-base environment is activated
prompt_anaconda_not_base() {
    if [[ "$CONDA_DEFAULT_ENV" != "" && "$CONDA_DEFAULT_ENV" != "base" ]]; then
        prompt_anaconda
    fi
}

# Powerlevel9k configuration
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir anaconda_not_base vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs time)
export POWERLEVEL9K_MODE="nerdfont-complete"
export ZLE_RPROMPT_INDENT=0

# fzf configuration
export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore -l ""'

# Source zplug
source ~/.zplug/init.zsh

# Let zplug manage itself
zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "lukechilds/zsh-nvm"
zplug "zdharma/zsh-diff-so-fancy"
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug "BurntSushi/ripgrep", from:gh-r, as:command, rename-to:rg
zplug "lib/completion", from:oh-my-zsh
zplug "esc/conda-zsh-completion"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Prompt theme
zplug "romkatv/powerlevel10k", as:theme, depth:1

# Install plugins which are not yet installed
if ! zplug check; then
    zplug install
fi

# Load all plugins
zplug load >/dev/null

# Add binaries of common applications to PATH
command -v yarn &>/dev/null && export PATH="$PATH:$(yarn global bin)"
command -v inkdrop &>/dev/null && export PATH="$PATH:/usr/lib/inkdrop/resources/app/ipm/bin"

# History substring search keybindings
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down
