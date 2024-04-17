
# NVIM configuration

## Installation

You obviously need to have [NVIM](https://neovim.io/) installed.

Assuming this is done, you can install this configuration with:

```bash
# Apply this configuration
cd nvim
zsh install.zsh
```

Notes:
- Any existing `$XDG_CONFIG_HOME/nvim` directory will be backed up as `XDG_CONFIG_HOME/nvim.bak` before being replaced.
- There is a call to `:PackerSync` at the end of the install script, so it will install all plugins. However,
if things don't work, you can probably finish the installation by running `:PackerSync` in nvim.
