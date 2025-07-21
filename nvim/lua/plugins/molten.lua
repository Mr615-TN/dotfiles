return {
  -- Molten.nvim for Jupyter Notebook integration
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- Pin to version <2.0.0 to avoid breaking changes
    dependencies = {
      "3rd/image.nvim", -- Molten uses image.nvim for image rendering
    },
    build = ":UpdateRemotePlugins", -- Essential for remote plugins
    init = function()
      -- Tell Molten.nvim to use image.nvim as its image provider
      vim.g.molten_image_provider = "image.nvim"
      -- Set a reasonable maximum height for the Molten output window.
      -- Images within this window will scale according to image.nvim's settings.
      vim.g.molten_output_win_max_height = 20
    end,
  },

  -- image.nvim for displaying images inline
  {
    "3rd/image.nvim",
    -- Crucial: Prevents building the 'magick_rock' as we're using 'magick_cli'
    build = false,
    opts = {
      backend = "kitty", -- Your preferred terminal backend (e.g., "kitty", "ueberzugpp", "wezterm")
      processor = "magick_cli", -- Use the ImageMagick command-line tools
      integrations = {
        -- Enable Markdown integration, essential for Jupyter notebooks
        markdown = {
          enabled = true,
          -- Keep images visible when entering insert mode
          clear_in_insert_mode = false,
          -- Allow downloading remote images (e.g., from web URLs in notebooks)
          download_remote_images = true,
          -- Render images immediately, not just when the cursor is on them
          only_render_image_at_cursor = false,
          -- Render images inline, not in floating windows for markdown
          floating_windows = false,
          -- Specify filetypes where markdown integration should be active
          filetypes = { "markdown", "vimwiki", "quarto" },
        },
        -- Disable other integrations if not needed to keep it simple
        neorg = { enabled = false },
        typst = { enabled = false },
        html = { enabled = false },
        css = { enabled = false },
      },
      -- Allow images to take up full width/height of the window if needed
      max_width_window_percentage = math.huge,
      max_height_window_percentage = math.huge,
      -- Clear images when windows overlap to prevent visual clutter
      window_overlap_clear_enabled = true,
      -- Ignore specific filetypes for overlap clearing (e.g., completion menus)
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
      -- Render images only when the editor window is focused
      editor_only_render_when_focused = false,
      -- Auto show/hide images in the correct Tmux window (needs visual-activity off in Tmux)
      tmux_show_only_in_active_window = false,
      -- Automatically render these file types as images when opened directly
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
    },
  },
}
