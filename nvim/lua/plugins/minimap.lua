return {
  "Isrothy/neominimap.nvim",
  lazy = false, -- Recommended to load immediately
  config = function()
    -- Recommended options for float layout
    vim.opt.wrap = false
    vim.opt.sidescrolloff = 36

    --- Neominimap configuration
    ---@type Neominimap.UserConfig
    vim.g.neominimap = {
      auto_enable = false, -- Enable the minimap globally by default
    }
  end,
  keys = {
    -- Global Minimap Controls
    { "<leader>nm", "<cmd>Neominimap Toggle<cr>", desc = "Toggle global minimap" },
    { "<leader>nr", "<cmd>Neominimap Refresh<cr>", desc = "Refresh global minimap" },
  },
}
