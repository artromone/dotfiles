-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices

-- For example, changing the color scheme:

config.color_scheme = "Tokyo Night"
config.keys = {
	-- Открыть новую вкладку
	{ key = "t", mods = "CTRL", action = act.SpawnTab("CurrentPaneDomain") },

	-- Разделить панель вертикально
	{ key = "8", mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Разделить панель горизонтально
	{ key = "9", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
}

-- and finally, return the configuration to wezterm
return config
