# Set up miniconda if it is installed
if [[ -d "/home/jasper/.miniconda3" ]]; then
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/jasper/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/jasper/.miniconda3/etc/profile.d/conda.sh" ]; then
            . "/home/jasper/.miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/jasper/.miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

    # There seems to be a bug where the wrong binaries are loaded by default
    # Re-activating the base environment seems to fix this
    # See https://stackoverflow.com/q/36733179
    conda deactivate
    conda activate base
fi
