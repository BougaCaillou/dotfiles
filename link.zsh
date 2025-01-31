#!/bin/zsh

# Define key-value pairs of source and destination paths
# Format: "source_path -> destination_path"
LINKS=(
  "$DOTFILES/asdf/.asdfrc -> $HOME/.asdfrc"
  "$DOTFILES/bat -> $XDG_CONFIG_HOME/bat"
  "$DOTFILES/git/.gitconfig -> $HOME/.gitconfig"
  "$DOTFILES/nix -> $XDG_CONFIG_HOME/nix"
  "$DOTFILES/nvim -> $XDG_CONFIG_HOME/nvim"
  "$DOTFILES/omz/.zshrc -> $HOME/.zshrc"
  "$DOTFILES/omz/custom -> $HOME/.oh-my-zsh/custom"
  "$DOTFILES/starship/starship.toml -> $XDG_CONFIG_HOME/starship.toml"
  "$DOTFILES/tmux/.tmux.conf -> $HOME/.tmux.conf"
  "$DOTFILES/wezterm -> $XDG_CONFIG_HOME/wezterm"
)

# Parse arguments
SKIP_EXISTING=true
while getopts "f" opt; do
  case "$opt" in
    f) SKIP_EXISTING=false ;;
  esac
done

# Initialize variables
src=""
dst=""

# Function to create symbolic links
link_files() {
  for entry in "${LINKS[@]}"; do
    # Split entry into source and destination
    src="${entry%% -> *}"
    dst="${entry##* -> }"

    if [[ ! -e "$src" ]]; then
      echo "Skipping: Source file does not exist: $src"
      continue
    fi

    # Check if destination already exists
    if [[ -e "$dst" || -L "$dst" ]]; then
      if $SKIP_EXISTING; then
        echo "Skipping: Destination already exists: $dst"
        continue
      fi
      echo "Removing existing: $dst"
      rm -rf "$dst"
    fi

    # Ensure the parent directory exists
    mkdir -p "$(dirname "$dst")"

    # Create symbolic link
    ln -s "$src" "$dst"
    echo "Linked: $src -> $dst"
  done
}

# Execute the linking process
link_files

