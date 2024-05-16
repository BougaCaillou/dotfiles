# This file exists because my configuration enables this plugin.
# Since I don't want to remove it from my rc file, this file is here to
# prevent errors.

if [ -f $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

