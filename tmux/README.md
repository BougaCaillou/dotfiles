
# TMUX configuration

## Installation

You obviously need to have [TMUX](https://github.com/tmux/tmux/wiki) installed.

Assuming this is done, you can install this configuration with:

```bash
# Apply this configuration
cd tmux
zsh install.zsh
```

Notes:
- Any existing `.tmux.conf` file will be backed up as `.tmux.conf.bak` before being replaced.
- The install script uses `$XDG_CONFIG_HOME` if set, otherwise it defaults to `~/.config`.
