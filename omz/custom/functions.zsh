
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

# "pgcli local", aka connect to local postgres
pgcl () {
  pgcli postgres://postgres:$PGPWDL@localhost:5432/postgres
}

# "psql local", aka execute a sql script on local postgres
psqll () {
  if [[ $# -ne 1 ]]; then
    echo "USAGE: psqll file.sql"
    return 1
  fi

  find $1 2>/dev/null
  if [[ $? -ne 0 ]]; then
    echo "Error while trying to read sql script '$1'"
    return 2
  fi

  PGPASSWORD=$PGPWDL psql -h localhost -p 5432 -U postgres postgres -f $1
}

# Out the curren week number
week () {
  date +%V
}

# Various functions to manage projects (mostly make commands)
cli() {
  make clean
  make install
}
clir() {
  make clean
  make install
  make run
}
clib() {
  make clean
  make install
  make build
}
clibt() {
  make clean
  make install
  make build-test
}
clp () {
  make clean
  make prepare
}
clpr () {
  make clean
  make prepare
  make run
}
clpb () {
  make clean
  make prepare
  make build
}
clpbt () {
  make clean
  make prepare
  make build-test
}

mir () {
  make install
  make run
}
mib () {
  make install
  make build
}
mibt () {
  make install
  make build-test
}
mpr () {
  make prepare
  make run
}
mpb () {
  make prepare
  make build
}
mpbt () {
  make prepare
  make build-test
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

# Prints a local postgresql connection string (useful when using mermerd to generate erd diagrams)
ldb() {
  echo "postgres://postgres:$PGPWDL@localhost:5432/postgres"
}

v() {
  [ -z "$1" ] && nvim . || nvim $1
}

# Rebuild nix profile based on my flake
rebuild() {
  darwin-rebuild switch --flake $DOTFILES/nix-darwin
  exec zsh
}

