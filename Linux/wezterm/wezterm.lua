local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Window configuration
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.window_padding = {
	left = 12,
	right = 12,
	top = 12,
	bottom = 12,
}
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"

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
-- Shell configuration
config.default_prog = { "/bin/bash", "-l" }

-- Color schemes
--config.color_scheme = "AdventureTime"
--config.color_scheme = "Batman"
--config.color_scheme = "ChallengerDeep"
--config.color_scheme = "DoomOne"
--config.color_scheme = "Everforest Dark (Gogh)"
config.color_scheme = "Gruvbox dark, pale (base16)"

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

-- Mouse configuration
config.hide_mouse_cursor_when_typing = false

-- Automatically copy selected text to clipboard
config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action.CompleteSelection("Clipboard"),
	},
}

-- Debug settings (most debug settings from alacritty don't have direct equivalents in wezterm)
config.debug_key_events = false

return config
