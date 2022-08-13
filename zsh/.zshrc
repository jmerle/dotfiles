# Source all files in .zsh/
for file in ~/.zsh/*.zsh; do
    source $file
done

# Source ~/.localrc if it exists
if [[ -f ~/.localrc ]]; then
  source ~/.localrc
fi
