local wezterm = require("wezterm")
local config = require("config")
require("events")

-- Apply color scheme based on the WEZTERM_THEME environment variable
local themes = {
	nord = "Nord (Gogh)",
	onedark = "One Dark (Gogh)",
}
local success, stdout, stderr = wezterm.run_child_process({ os.getenv("SHELL"), "-c", "printenv WEZTERM_THEME" })
local selected_theme = stdout:gsub("%s+", "") -- Remove whitespace
config.color_scheme = themes[selected_theme]

-- ✅ Add transparency and blur settings here (final layer)
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE" -- allows blur/opacity
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20

-- Optional: ensure background layering order is correct
config.background = {
	{
		source = {
			File = "/Users/" .. os.getenv("USER") .. "/Pictures/ravens.jpg",
		},
		opacity = 0.5, -- controls image transparency
		hsb = {
			brightness = 0.25,
		},
	},
	{
		source = { Color = "#000000" },
		width = "100%",
		height = "100%",
		opacity = 0.15, -- dim overlay to make text readable
	},
}

return config