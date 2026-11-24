
# Deletes a tag from a repo (locally and remotly)
deltag () {
  git push origin :refs/tags/$1 && git tag -d $1
}

# TMUX smart attach (requires my tmux config and scrits)
ta () {
  zsh "$TMUX_HOME/sessions/ta.zsh"
}

# git checkout search
gcos () {
  g checkout $(git for-each-ref --format='%(refname:short)' refs/heads/ | gum filter --placeholder="Choose a branch...")
}

# Outputs the path variables in an line by line format
path() {
	echo $PATH | tr ':' '\n'
}

# Out the curren week number
week () {
  date +%V
}

# Function to vi into whatever using which
see() {
  if [[ $# -ne 1 ]]; then
    echo "USAGE: see <command>"
    return 1
  fi

  which $1 > /dev/null
  if [[ $? -ne 0 ]]; then
    echo "Command '$1' not found"
    return 2
  fi

  $EDITOR $(which $1)
}

gccb() {
  echo -n $(gb | rg '\*' | cut -d ' ' -f 2) | pbcopy
}

# Rebuild nix profile based on my flake
rebuild() {
  sudo darwin-rebuild switch --flake $DOTFILES/nix-darwin
  exec zsh
}

