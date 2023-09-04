# Set up Mambaforge if it is installed

export MAMBA_NO_BANNER=1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jasper/.mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jasper/.mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/jasper/.mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/jasper/.mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/jasper/.mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/home/jasper/.mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
