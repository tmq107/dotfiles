-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 13

config.color_scheme = 'catppuccin-mocha'
-- config.window_background_opacity = 0.65

config.keys = {
  { key = 'V', mods = 'CTRL',       action = act.PasteFrom 'Clipboard' },
  { key = 'V', mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard' },
  { key = 'C', mods = 'CTRL|SHIFT', action = act.CopyTo 'Clipboard' },
}

-- config.background = {
--   {
--     source = {
--       File = "/home/quanthai/.config/wezterm/img/darker_unicat.png",
--     },
--     opacity = 1.0,
--   },
-- }

-- key
config.mouse_bindings = {
    -- Paste on right click
    {
      event = { Down = { streak = 1, button = 'Right' } },
      mods = 'NONE',
      action = act.PasteFrom 'Clipboard',
    },
    -- Copy on left-button release after selection
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'NONE',
      action = act.CopyTo 'PrimarySelection',
    },
}
-- Finally, return the configuration to wezterm:
return config
