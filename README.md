
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
# ln -s ~/repos/dotfiles/tmux ~/.config/tmux

# Nvim configuration symlinked
ln -s ~/repos/dotfiles/nvim ~/.config/nvim
# You can run this to make sure the plugins are ok
nvim --headless -c 'autocom User PackerComplete quitall' -c 'PackerSync'
```
