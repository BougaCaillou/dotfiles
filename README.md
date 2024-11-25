
# Dotfiles

## Installation

To use these configurtions, I recommend cloning this repository wherever you want,
then symlinking the configuration files to their respective locations.

Here is a non exhaustive list of the configurations that can be symlinked:

```bash
# Clone the repository
git clone git@github.com:BougaCaillou/dotfiles.git ~/repos/dotfiles

# Symlink the tmux configuration
ln -s ~/repos/dotfiles/tmux/tmux.conf ~/.tmux.conf
# (if you want to use the scripts found here)
ln -s ~/repos/dotfiles/tmux ~/.config/tmux

# Nvim configuration symlinked
ln -s ~/repos/dotfiles/nvim ~/.config/nvim
# You can run this to make sure the plugins are ok
nvim --headless -c 'autocom User PackerComplete quitall' -c 'PackerSync'

# Symlink the omz configuration
ln -s ~/repos/dotfiles/omz/.zshrc ~/.zshrc
ls -s ~/repos/dotfiles/omz/themes/* ~/.oh-my-zsh/custom/themes/
ln -s ~/repos/dotfiles/omz/custom/* ~/.oh-my-zsh/custom/
# The next command is a bit complex because it creates a symlink for each plugin to .oh-my-zsh/custom/plugins
# (using * like the previous line does not work because custom plugins are directories)
for i in `\ls -d -1 ~/repos/dotfiles/omz/plugins/*`; do ln -s $i ~/.oh-my-zsh/custom/plugins/$(echo $i | rev | cut -d "/" -f 1 | rev); done
```

## TODO

- Nix home manager
- Fish shell
- Starship prompt
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
