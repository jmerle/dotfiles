# Custom Powerlevel9k segment for Miniconda which only appears if a non-base environment is activated
prompt_anaconda_not_base() {
    if [[ "$CONDA_DEFAULT_ENV" != "" && "$CONDA_DEFAULT_ENV" != "base" ]]; then
        prompt_anaconda
    fi
}

# Powerlevel9k configuration
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir anaconda_not_base virtualenv vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs time)
export POWERLEVEL9K_MODE="nerdfont-complete"
export ZLE_RPROMPT_INDENT=0

# Source zplug
source ~/.zplug/init.zsh

# Let zplug manage itself
zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "zdharma-continuum/zsh-diff-so-fancy"
zplug "supercrabtree/k"
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
zplug load

# History substring search keybindings
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down
