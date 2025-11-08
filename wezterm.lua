local wezterm = require("wezterm")
local config = require("config")
require("events")

-- Apply color scheme based on the WEZTERM_THEME environment variable
local themes = {
  nord = "Nord (Gogh)",
  onedark = "One Dark (Gogh)",
}
local selected_theme = os.getenv("WEZTERM_THEME") or "nord"  -- Simplified theme selection
config.color_scheme = themes[selected_theme]

-- Background image and transparency
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20

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
