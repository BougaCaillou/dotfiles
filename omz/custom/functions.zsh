
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

# Smart "yarn link"
yl () {
  if [ $# -eq 0 ]
  then
    yarn link
  else
    yarn link "@synapse-medicine/$1"
  fi
}

# "pgcli local", aka connect to local postgres (password is hardcoded because I use the default one locally)
pgcl () {
  pgcli postgres://postgres:mysecretpassword@localhost:5432/postgres
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

  psql postgres://postgres:mysecretpassword@localhost:5432/postgres -f $1
}

# "pgcli test", aka connect to test postgres
pgct () {
  pgcli $(bastion db-uri test21-cluster usermanagement)
}

# "psql test", aka execute a sql script on test postgres
psqlt () {
  if [[ $# -ne 1 ]]; then
    echo "USAGE: psqlt file.sql"
    return 1
  fi

  find $1 2>/dev/null
  if [[ $? -ne 0 ]]; then
    echo "Error while trying to read sql script '$1'"
    return 2
  fi

  psql $(bastion db-uri test21-cluster usermanagement) -f $1
}

# "pgcli prod", aka connect to prod postgres
# Use with caution
pgcp () {
  pgcli $(bastion db-uri prod21-cluster usermanagement)
}

# "psql prod", aka execute a sql script on prod postgres
# Use with caution
psqlp () {
  if [[ $# -ne 1 ]]; then
    echo "USAGE: psqlp file.sql"
    return 1
  fi

  find $1 2>/dev/null
  if [[ $? -ne 0 ]]; then
    echo "Error while trying to read sql script '$1'"
    return 2
  fi

  psql $(bastion db-uri prod21-cluster usermanagement) -f $1
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

# Prints the currently linked Synapse package
links() {
  packages=$(\ls -Gl node_modules/@synapse-medicine) 2> /dev/null

  # Handling "not found" error by using $?
  # File not found would return non 0 code
  if [[ $? -ne 0 ]]; then
    echo "Error: node_modules/@synapse-medicine not found."
    echo "Either install packages by running npm install or you are not currently in a Synapse project"
    return 1
  fi

  # Filtering strings that do not have "->" (sign of an active link)
  linked="$(echo $packages | grep "\->" | xargs)"
  if [[ "$(echo $linked | wc -c)" -eq 1 ]]; then
    echo "No packages are linked right now"
    return 0
  fi

  echo "Linked packages:"
  for i in $(\ls -G node_modules/@synapse-medicine)
  do
    if [[ $linked == *"$i"* ]]; then
      echo "- $i"
    fi
  done
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
  echo "postgres://postgres:mysecretpassword@localhost:5432/postgres"
}

v() {
  [ -z "$1" ] && nvim . || nvim $1
}

# Rebuild nix profile based on my flake
rebuild() {
  darwin-rebuild switch --flake $DOTFILES/nix-darwin
  exec zsh
}

