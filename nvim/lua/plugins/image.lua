return {
  "3rd/image.nvim",
  build = false, -- Important: Prevents building the 'magick_rock' as we're using 'magick_cli'
  opts = {
    backend = "kitty", -- Your preferred terminal backend for image rendering
    processor = "magick_cli", -- Uses the ImageMagick command-line tools
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        only_render_image_at_cursor_mode = "popup",
        floating_windows = false,
        filetypes = { "markdown", "vimwiki" },
      },
      neorg = {
        enabled = true,
        filetypes = { "norg" },
      },
      typst = {
        enabled = true,
        filetypes = { "typst" },
      },
      -- html and css are disabled by default or explicitly set to false in your original config,
      -- so we can either omit them or keep them explicitly false for clarity.
      html = { enabled = false },
      css = { enabled = false },
    },
    -- Keep specific window sizing and overlap settings
    max_height_window_percentage = 50,
    window_overlap_clear_enabled = false,
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
    editor_only_render_when_focused = false,
    tmux_show_only_in_active_window = false,
    -- Keep file patterns for direct image file viewing
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
  },
}
