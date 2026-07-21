local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Documentation: https://wezterm.org/config/files.html

config.color_scheme = 'Dracula'

config.font_size = 10
config.harfbuzz_features = { 'calt = 0', 'clig = 0', 'liga = 0' }

config.initial_cols = 120
config.initial_rows = 30

config.tab_bar_at_bottom = true

config.window_frame = {
  font_size = config.font_size,
}

return config
