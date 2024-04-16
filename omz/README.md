
# ZSH configuration

## Installation

It is based on [oh-my-zsh](https://ohmyz.sh/), so you need to install it first.

Also even if it's not required, I recommend using [Pure prompt](https://github.com/sindresorhus/pure) as
there is a configuration file for it.

This is using curl for omz and homebrew for pure prompt, but install them as you prefer:

```bash
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install pure prompt
brew install pure

# Apply this configuration
zsh install.zsh
```

Notes:
- Any existing `.zshrc` file will be backed up as `.zshrc.bak` before being replaced.
- This installation does not handle [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/tree/master) which is very cool to have.

## ENV files

The file `env.zsh` is added to git and copied when installing this config.

The file `env-secret.zsh` is gitignored and should be created manually if needed (it will be copied as well).

## Other utils

This config uses a lot of external tools, here is a non exhaustive list:
- fzf
- bat
- eza
- mcfly
- curlie
- zoxide
- gum
- pgcli

Here are some useful links for everything (also non exhaustive):
- [Oh My Zsh](https://ohmyz.sh/)
- [Pure prompt](https://github.com/sindresorhus/pure)
- [ZSH Synthax highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/tree/master)
- [Modern Unix](https://github.com/ibraheemdev/modern-unix)
- [Gum](https://github.com/charmbracelet/gum)
- [Pgcli](https://www.pgcli.com/)

