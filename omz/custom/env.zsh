# PATH
PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin";

# Dotfiles home directory
export DOTFILES="$HOME/repos/dotfiles"

# Oh you got me some BINs
PATH="$HOME/bin:$HOME/.yarn/bin:$HOME/repos/REDACTED_TOOLING/bin:$HOME/python-venv/bin:$PATH";

# ADD Ruby
PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

# Preffered editor for broot
export EDITOR=nvim

# Widget demo page
export REDACTED_WIDGET_URL=http://localhost:8080

# User management env var
export APP_STORE_ENVIRONMENT="sandbox"

# Android env var
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT=$ANDROID_HOME
PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/build-tools:$ANDROID_HOME/platform-tools:$PATH";

# Java home
export JAVA_ROOT=/Library/Java/JavaVirtualMachines

# libpq (postgre dump  and restore utilities)
PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

# Postgresql env vars
export PGPWDL='mysecretpassword'

# Rust utilities (cargo etc)
PATH="$HOME/.cargo/bin:$PATH"

# Custom tools (one ofs, i.e. Mermerd...)
PATH="$HOME/custom-tools:$PATH"

# REDACTED_TOOLING bin
PATH="$HOME/repos/REDACTED_TOOLING/bin:$PATH"

# Local bin directory
PATH="$HOME/.local/bin:$PATH"

# TMUX home directory
export TMUX_HOME="$HOME/.config/tmux"

# Main projects directory (where all the projects are cloned)
export PROJECTS_DIR="$HOME/repos"

# Setting XDG directories
export XDG_CONFIG_HOME="$HOME/.config"

# Adding stuff for nix darwin
PATH="/run/current-system/sw/bin:$PATH"

# Nix darwin flake path
export NIX_CONF_DIR="$DOTFILES/nix-darwin"
PATH="/nix/var/nix/profiles/default/bin:$PATH"

# asdf stuff
export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY=latest_installed

export PATH;

