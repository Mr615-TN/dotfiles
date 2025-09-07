return {
  -- This is the main configuration for the tokyonight.nvim plugin.
  -- LazyVim will use these settings to apply your custom theme.
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Set the base theme to 'night' to start with
      style = "night",

      -- Use the on_colors function to override the default palette
      on_colors = function(colors)
        -- Colors for the main UI elements, inspired by the AE86
        colors.bg_normal = "#1A1A1A" -- Deep black like the AE86's hood
        colors.fg = "#F5F5F5" -- Bright white like the AE86's body
        colors.fg_dark = "#BDC3C7" -- A slightly darker white for secondary text

        -- The color palette for syntax highlighting, inspired by the
        -- aesthetic of the Initial D world.
        colors.comment = "#81C8BE" -- Misty blue-green like the mountain fog
        colors.statement = "#F1C40F" -- Vibrant yellow for keywords, like headlights and team logos
        colors.keyword = "#F1C40F" -- Another vibrant yellow
        colors.variable = "#8CAAEE" -- A cool blue for variables, like the Akina Speed Stars logo
        colors.special = "#E74C3C" -- Bright red for warnings or important elements, like the Night Kids team
        colors.error = "#E74C3C" -- Red for errors
        colors.warning = "#E74C3C" -- Red for warnings
        colors.info = "#3498DB" -- Blue for info messages
        colors.border = "#F1C40F" -- Yellow border for windows
        colors.syntax.string = "#A6D189" -- Green, like a trackside tree
      end,
    },
    config = function()
      -- This command applies the colorscheme after the plugin is loaded.
      vim.cmd("colorscheme tokyonight")
    end,
  },
}
