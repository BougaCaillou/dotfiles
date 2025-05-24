
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
  # yellow warning message saying this is deprecated and should be replaced with pgc
  echo -e "\033[33mThis function is deprecated, you should use \"pgc local\" instead\033[0m"
  pgcli postgres://postgres:mysecretpassword@localhost:5432/postgres
}

# "psql local", aka execute a sql script on local postgres
psqll () {
  # yellow warning message saying this is deprecated and should be replaced with pgc
  echo -e "\033[33mThis function is deprecated, you should use \"pgc local script.sql\" instead\033[0m"

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
  # yellow warning message saying this is deprecated and should be replaced with pgc
  echo -e "\033[33mThis function is deprecated, you should use \"pgc test-eu\" instead\033[0m"
  pgcli $(bastion db-uri test21-cluster usermanagement)
}

# "psql test", aka execute a sql script on test postgres
psqlt () {
  # yellow warning message saying this is deprecated and should be replaced with pgc
  echo -e "\033[33mThis function is deprecated, you should use \"pgc test-eu script.sql\" instead\033[0m"
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
  # yellow warning message saying this is deprecated and should be replaced with pgc
  echo -e "\033[33mThis function is deprecated, you should use \"pgc prod-eu\" instead\033[0m"
  pgcli $(bastion db-uri prod21-cluster usermanagement)
}

# "psql prod", aka execute a sql script on prod postgres
# Use with caution
psqlp () {
  # yellow warning message saying this is deprecated and should be replaced with pgc
  echo -e "\033[33mThis function is deprecated, you should use \"pgc prod-eu script.sql\" instead\033[0m"
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
  echo -e "\033[33mThis function is deprecated, you should use \"pgc -s local\" instead\033[0m"
  echo "postgres://postgres:mysecretpassword@localhost:5432/postgres"
}

# Rebuild nix profile based on my flake
rebuild() {
  sudo darwin-rebuild switch --flake $DOTFILES/nix-darwin
  exec zsh
}

# Outputs a connection string for a postgres db of a given environment
pgc() {
  if [[ $# -lt 1 || $# -gt 3 ]]; then
    echo "USAGE: pgc [-s] <environment>"
    return 1
  fi

  local silent=false
  local env=""
  local script=""

  # Parse optional -s flag
  if [[ "$1" == "-s" ]]; then
    if [[ $# -ne 2 ]]; then
      echo "Silent mode can be called with 2 arguments only"
      echo "USAGE: pgc [-s] <environment>"
      return 1
    fi
    silent=true
    env="$2"
  else
    env="$1"
  fi

  # Optional script argument
  if [[ -n $2 && $silent == false ]]; then
    find $2 >/dev/null
    if [[ $? -ne 0 ]]; then
      echo "Error while trying to read sql script '$2' (see above)"
      return 2
    fi
    script="$2"
  fi

  local context="" # context for kubectx
  local user="postgres"
  local password=""
  local host="proxy.corp.synapse-medicine.com"
  local port=""
  local db="usermanagement"  # default, overridden in some cases

  case $env in
    local)
      password="mysecretpassword"
      host="localhost"
      port="5432"
      db="postgres"
      ;;
    test-eu)
      context="test21-cluster"
      port="9000"
      ;;
    preprod-eu)
      context="preprod-eu"
      port="9100"
      ;;
    prod-eu)
      context="prod21-cluster"
      port="9101"
      ;;
    prod-us)
      context="prod23-us-cluster"
      port="9102"
      ;;
    *)
      echo "Unknown environment '$env'"
      return 3
      ;;
  esac

  # Setting the variable that can be fetched using kubectl contexts. The appropriate context was set above so this is the same regardless of the env argument
  # Note: not needed for local
  if [[ -n $context ]]; then
    local current_context=$(kubectl config current-context)

    if [[ $current_context != $context ]]; then
      echo "Requested env needs context switching, you are going to be switched around..."
      kubectx $context
    fi

    for i in `k get cm user-management-api-config -o json | jq '.data | with_entries(select(.key | match("DATABASE_(NAME|USER)"))) | to_entries | .[] | .key + "=" + (.value)'`; do
      eval "local $i"
    done

    password=$(kubectl get secret user-management-secret -o jsonpath='{.data.POSTGRES_PASSWORD}' | base64 --decode)
    db=${DATABASE_NAME:-$db}
    user=${DATABASE_USER:-$user}

    if [[ $current_context != $context && $silent == true ]]; then
      echo "Silent mode, reverting back to previous context..."
      kubectx $current_context
    fi
  fi

  local conn_str="postgres://${user}:${password}@${host}:${port}/${db}"

  if $silent; then
    echo "$conn_str"
  else
    if [[ -n $script ]]; then
      echo "Executing script '$script' on $env env..."
      psql "$conn_str" -f $script
    else
      pgcli "$conn_str"
    fi
  fi
}


