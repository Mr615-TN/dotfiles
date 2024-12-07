return {
  -- add doom-one
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },

  -- Configure LazyVim to load doom-one
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
}
