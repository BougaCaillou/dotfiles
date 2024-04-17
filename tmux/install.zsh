#!/bin/zsh

# Root of the config is $XDG_CONFIG_HOME/tmux or $HOME/.config/tmux if $XDG_CONFIG_HOME is not set
TMUX_HOME=${XDG_CONFIG_HOME:-$HOME/.config}/tmux

# Backing up the current .config/tmux directory and the .tmux.conf file
if [ -d ~/.config/tmux ]; then
  mv $TMUX_HOME $TMUX_HOME.bak
  echo "Backup of $TMUX_HOME created at $TMUX_HOME.bak"
fi

if [ -f ~/.tmux.conf ]; then
  mv ~/.tmux.conf ~/.tmux.conf.bak
  echo "Backup of .tmux.conf created at ~/.tmux.conf.bak"
fi

# Copying the session scripts and the script to start them
mkdir -p $TMUX_HOME/sessions
cp -r ./sessions/* $TMUX_HOME/sessions/

# Copying the .tmux.conf file
cp ./.tmux.conf $HOME/.tmux.conf

