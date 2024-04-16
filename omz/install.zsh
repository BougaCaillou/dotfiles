#!/bin/zsh

# Backing up the current .zshrc
if [ -f ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc.bak
  echo "Backup of .zshrc created at ~/.zshrc.bak"
fi

# Change this to the path where you installed omz
OMZ_PATH=~/.oh-my-zsh

# Custom files (will autoload with omz)
cp ./aliases.zsh $OMZ_PATH/custom/aliases.zsh
cp ./custom-pure.zsh $OMZ_PATH/custom/custom-pure.zsh
cp ./env.zsh $OMZ_PATH/custom/env.zsh
cp ./env-secret.zsh $OMZ_PATH/custom/env-secret.zsh 2>/dev/null
cp ./functions.zsh $OMZ_PATH/custom/functions.zsh

# Custom theme and plugins
cp ./themes/bouga.zsh-theme $OMZ_PATH/custom/themes/bouga.zsh-theme
cp -r ./plugins/* $OMZ_PATH/custom/plugins/

# RC file
cp ./.zshrc ~/.zshrc

