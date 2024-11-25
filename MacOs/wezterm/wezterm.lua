local wezterm = require("wezterm")
local config = {}

-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Window configuration
config.window_decorations = "RESIZE" -- Changed from NONE to RESIZE for better window management
config.window_background_opacity = 0.8
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}
config.enable_tab_bar = true
config.window_close_confirmation = "NeverPrompt"
config.macos_window_background_blur = 20 -- Adjusted to match example

-- Initial window size
config.initial_rows = 38
config.initial_cols = 136

-- Font configuration
config.font = wezterm.font("JetBrainsMono NFM", { weight = "Regular" })
config.font_rules = {
	{
		italic = true,
		font = wezterm.font_with_fallback({
			{
				family = "JetBrainsMono NFM",
				style = "Italic",
			},
		}),
	},
	{
		intensity = "Bold",
		font = wezterm.font_with_fallback({
			{
				family = "JetBrainsMono NFM",
				weight = "Bold",
			},
		}),
	},
}
config.font_size = 13

-- Color schemes
--config.color_scheme = "AdventureTime"
--config.color_scheme = "Batman"
--config.color_scheme = "ChallengerDeep"
config.color_scheme = "DoomOne"
--config.color_scheme = "Everforest Dark (Gogh)"

-- Scrollback
config.scrollback_lines = 500

-- Selection behavior
config.selection_word_boundary = " \t\n{}[]()\"'`,;:"

-- Hyperlinks
config.hyperlink_rules = {
	-- URL with protocol
	{
		regex = "(ipfs:|ipns:|magnet:|mailto:|gemini://|gopher://|https://|http://|news:|file:|git://|ssh:|ftp://)[^⟨⟩\\s{-}\\^\\\\\\[\\]`]+",
		format = "$0",
	},
}

--Word wrap
--config.line_wrapping = "Enabled"

-- Mouse configuration
config.hide_mouse_cursor_when_typing = false

-- Debug settings
config.debug_key_events = false
config.adjust_window_size_when_changing_font_size = false
config.use_fancy_tab_bar = false
config.warn_about_missing_glyphs = false

return config
