
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

- Fish shell
- Nu shell
- Tmux yank
- Add other configurations i might have forgotten (recently added bat and wezterm for example)
- Function to connect to a db
  - using a conf file (at XDG home) for all options
    - specifying which client to use (psql, pgcli, ...)
    - which environment are available (test, prod, pre-release, ...)
  - then using bastion to build the connection string (using `bastion db-uri <env> <db>` function)
  - build a completion for this (probably when fish shell is used, because it is easier to do than with zsh)
- Aerospace setup when ?
- Podman looks sick
