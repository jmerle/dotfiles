# Source all files in .zsh/
for file (~/.zsh/*.zsh) source $file

# Source ~/.localrc if it exists
if [[ -f ~/.localrc ]]; then
  source ~/.localrc
fi
