PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin";

export DOTFILES="$HOME/repos/dotfiles"

# Oh you got me some BINs
PATH="$HOME/bin:$HOME/.yarn/bin:$HOME/repos/kubernetes-tooling/bin:$HOME/python-venv/bin:$PATH";

PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

# Preffered editor for broot
export EDITOR=nvim

# Widget demo page
export PUBLIC_SYNAPSE_WIDGET_URL=http://localhost:8080

# User management env var
export APP_STORE_ENVIRONMENT="sandbox"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT=$ANDROID_HOME
PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/build-tools:$ANDROID_HOME/platform-tools:$PATH";

export JAVA_ROOT=/Library/Java/JavaVirtualMachines

# libpq (postgre utils)
PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

PATH="$HOME/.cargo/bin:$PATH"

# Custom tools (one ofs, i.e. Mermerd...)
PATH="$HOME/custom-tools:$PATH"

# Kubernetes tooling from Synapse \o/
PATH="$HOME/repos/kubernetes-tooling/bin:$PATH"

PATH="$HOME/.local/bin:$PATH"

export TMUX_HOME="$HOME/.config/tmux"

export PROJECTS_DIR="$HOME/repos"

export XDG_CONFIG_HOME="$HOME/.config"

PATH="/run/current-system/sw/bin:$PATH"
export NIX_CONF_DIR="$DOTFILES/nix-darwin"
PATH="/nix/var/nix/profiles/default/bin:$PATH"

export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY=latest_installed

PATH="$HOME/.meteor:$PATH"

export PATH;

