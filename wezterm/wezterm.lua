local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
config.window_background_opacity = 0.85

config.window_padding = {
  left = 7,
  right = 7,
  top = 7,
  bottom = 7,
}

-- Now using tmux, there will be only one tab
config.hide_tab_bar_if_only_one_tab = true

return config

