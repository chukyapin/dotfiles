local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- 基本設定
config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"

-- fonts
config.font = wezterm.font("JetBrains Mono", { weight = "Thin", stretch = "Normal", style = "Italic" })
config.font_size = 22

-- window
config.color_scheme = "Dracula"
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 0
config.hide_tab_bar_if_only_one_tab = true

config.disable_default_key_bindings = true
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables
config.leader = { key = "w", mods = "CTRL", timeout_milliseconds = 2000 }

return config
