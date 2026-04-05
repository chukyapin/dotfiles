local wezterm = require("wezterm")
local config = wezterm.config_builder()
wezterm.log_info("reloading")

local tabs = require("tabs")
local mouse = require("mouse")
local links = require("links")
local keys = require("keys")

tabs.setup(config)
mouse.setup(config)
links.setup(config)
keys.setup(config)

config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt" -- AlwaysPrompt or NeverPrompt
config.window_background_opacity = 0.80
config.macos_window_background_blur = 20
config.audible_bell = "Disabled"

config.hide_mouse_cursor_when_typing = true

config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.underline_thickness = 3
config.cursor_thickness = 4
config.underline_position = -6
config.enable_kitty_graphics = true

config.max_fps = 120
config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false

-- Fonts
config.font_size = 15
config.bold_brightens_ansi_colors = true

-- 英数字: Fira Code / 日本語: PlemolJP Console NF
config.font = wezterm.font_with_fallback({
	"Fira Code",
	"PlemolJP Console NF",
})

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
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.scrollback_lines = 10000

-- Command Palette
config.command_palette_font_size = 18
config.command_palette_bg_color = "#394b70"
config.command_palette_fg_color = "#000001"

return config
