# Taken from https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/pipenv/pipenv.plugin.zsh

# Automatic pipenv shell activation/deactivation
_togglePipenvShell() {
    # Deactivate shell if Pipfile doesn't exist and not in a subdir
    if [[ ! -a "$PWD/Pipfile" ]]; then
        if [[ "$PIPENV_ACTIVE" == 1 ]]; then
            if [[ "$PWD" != "$pipfile_dir"* ]]; then
                exit
            fi
        fi
    fi

    # Activate the shell if Pipfile exists
    if [[ "$PIPENV_ACTIVE" != 1 ]]; then
        if [[ -a "$PWD/Pipfile" ]]; then
            export pipfile_dir="$PWD"
            pipenv shell
        fi
    fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd _togglePipenvShell
