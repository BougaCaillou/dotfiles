
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

# Checks if a port is listened to, by the system and/or by a docker container (reported independently)
# Exit code: 0 if either listens, 1 if neither
portcheck() {
  if [[ $# -ne 1 ]]; then
    echo "USAGE: portcheck <port>"
    return 2
  fi

  local sys docker_out found=1
  sys=$(lsof -nP -iTCP:$1 -sTCP:LISTEN 2>/dev/null | tail -n +2)
  docker_out=$(docker ps --filter "publish=$1" --format '{{.Names}} ({{.Ports}})' 2>/dev/null)

  if [[ -n $sys ]]; then
    echo "system: listened"
    echo "$sys" | awk '{print "  " $1 " (pid " $2 ")"}'
    found=0
  else
    echo "system: free"
  fi

  if [[ -n $docker_out ]]; then
    echo "docker: listened"
    echo "$docker_out" | sed 's/^/  /'
    found=0
  else
    echo "docker: free"
  fi

  return $found
}

# Rebuild nix profile based on my flake
rebuild() {
  sudo darwin-rebuild switch --flake $DOTFILES/nix-darwin
  exec zsh
}

