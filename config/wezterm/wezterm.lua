local wezterm = require("wezterm")
local config = wezterm.config_builder()

require("tabs").setup(config)
require("keys").setup(config)

config.automatically_reload_config = true
config.window_background_opacity = 0.70
config.macos_window_background_blur = 30
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.audible_bell = "Disabled"

config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.color_scheme = "tokyonight_ night"

config.underline_thickness = 3
config.cursor_thickness = 4
config.underline_position = -6
config.enable_kitty_graphics = true

config.window_decorations = "RESIZE"

-- Fonts
config.font_size = 16
config.font = wezterm.font({ family = "Fira Code" })

config.bold_brightens_ansi_colors = true
config.font_rules = {
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({ family = "Maple Mono", weight = "Bold", style = "Italic" }),
	},
	{
		italic = true,
		intensity = "Half",
		font = wezterm.font({ family = "Maple Mono", weight = "DemiBold", style = "Italic" }),
	},
	{
		italic = true,
		intensity = "Normal",
		font = wezterm.font({ family = "Maple Mono", style = "Italic" }),
	},
}

-- Cursor
config.default_cursor_style = "BlinkingBar"
config.force_reverse_video_cursor = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
-- window_background_opacity = 0.9,
-- cell_width = 0.9,
config.scrollback_lines = 10000

return config
