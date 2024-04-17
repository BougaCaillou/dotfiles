#!/bin/zsh

NVIM_HOME=${XDG_CONFIG_HOME:-$HOME/.config}/nvim

# Backing up the current .config/nvim directory
if [ -d ~/.config/nvim ]; then
  mv $NVIM_HOME $NVIM_HOME.bak
  echo "Backup of $NVIM_HOME created at $NVIM_HOME.bak"
fi

# Copying everything
mkdir -p $NVIM_HOME/after
cp -r ./after/* $NVIM_HOME/after/
mkdir -p $NVIM_HOME/lua
cp -r ./lua/* $NVIM_HOME/lua/
cp ./init.lua $NVIM_HOME/init.lua

# This step is needed to keep the plugins synchronized
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

