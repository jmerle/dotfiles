# Dotfiles
My dotfiles, mostly coming from [holman](https://github.com/holman/dotfiles)'s dotfiles.

## Installation
1. Make sure `zsh` and `oh-my-zsh` are installed.
2. Install the [spaceship](https://github.com/denysdovhan/spaceship-prompt) zsh theme.
2. Copy `git/gitconfig.local.symlink` to `git/gitconfig.local.symlink`.
3. Do [this](https://askubuntu.com/a/776335).
4. Clone this repository to `.dotfiles`.
5. Run `./install`.

## Updating
Simply run `./install` again.

## Components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into the
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  `$HOME`. These get
  symlinked in when running `./install`.

`~/.localrc` is automatically sourced first, so anything machine-specific goes there.

## Order of loading

The various components are loaded in the following order:
1. Source `~/.localrc` if it exists.
2. Source all `topic/path.zsh` files.
3. Source all `topic/*.zsh` files, except for `topic/path.zsh` and `topic/completion.zsh` files.
4. Initialize autocomplete.
5. Source all `topic/completion.zsh` files.
