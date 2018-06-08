# Source all files in .zsh/
for file (~/.zsh/*.zsh) source $file

# Initialize SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# Source ~/.localrc if it exists
if [[ -f ~/.localrc ]]; then
  source ~/.localrc
fi
