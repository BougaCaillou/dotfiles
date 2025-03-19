
# Dotfiles

## Installation

To use these configurtions, I recommend cloning this repository wherever you want,
then use the make commands to link everything.

```bash
# Clone the repository
git clone git@github.com:BougaCaillou/dotfiles.git ~/repos/dotfiles

# Link everything
make
```

## TODO

- Rewrite nvim config (because it is a mess)
  - Either a config based on neovim kickstart or Lazyvim
  - Re add keymaps (and remove the unused ones)
- Fish shell
- Nu shell
- Tmux yank
- Function to connect to a db
  - using a conf file (at XDG home) for all options
    - specifying which client to use (psql, pgcli, ...)
    - which environment are available (test, prod, pre-release, ...)
  - then using bastion to build the connection string (using `bastion db-uri <env> <db>` function)
  - build a completion for this (probably when fish shell is used, because it is easier to do than with zsh)
- Aerospace setup when ?
- Podman looks sick
