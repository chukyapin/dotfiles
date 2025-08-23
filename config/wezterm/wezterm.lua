local wezterm = require("wezterm")
local config = wezterm.config_builder()

require("tabs").setup(config)
require("keys").setup(config)

config.automatically_reload_config = true
config.window_background_opacity = 0.7
config.macos_window_background_blur = 60
config.hide_tab_bar_if_only_one_tab = true
config.audible_bell = "Disabled"

config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- config.color_scheme = "AdventureTime"

config.underline_thickness = 3
config.cursor_thickness = 4
config.underline_position = -6
config.enable_kitty_graphics = true

-- if wezterm.target_triple:find("windows") then
-- 	config.default_prog = { "pwsh" }
config.window_decorations = "RESIZE"
-- 	wezterm.on("gui-startup", function(cmd)
-- 		local screen = wezterm.gui.screens().active
-- 		local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
-- 		local gui = window:gui_window()
-- 		local width = 0.7 * screen.width
-- 		local height = 0.7 * screen.height
-- 		gui:set_inner_size(width, height)
-- 		gui:set_position((screen.width - width) / 2, (screen.height - height) / 2)
-- 	end)
-- else
-- 	config.term = "wezterm"
-- 	config.window_decorations = "NONE"
-- end

-- Fonts
config.font_size = 14
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
