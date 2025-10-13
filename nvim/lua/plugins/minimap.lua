return {
  "Isrothy/neominimap.nvim",
  version = "v3.x.x",
  lazy = false, -- NOTE: NO NEED to Lazy load, as you indicated

  -- Optional: Define your keybindings within the plugin spec
  keys = {
    -- Global Minimap Controls
    { "<leader>nm", "<cmd>Neominimap Toggle<cr>", desc = "Toggle global minimap" },
    { "<leader>no", "<cmd>Neominimap Enable<cr>", desc = "Enable global minimap" },
    { "<leader>nc", "<cmd>Neominimap Disable<cr>", desc = "Disable global minimap" },
    { "<leader>nr", "<cmd>Neominimap Refresh<cr>", desc = "Refresh global minimap" },

    -- You can remove other keybindings if you only want global control
    -- If you want to keep them but not use them, that's fine too.
    -- I'm keeping only the global ones for simplicity as per your request
    -- to have a "very simple config".
  },
  init = function()
    -- These are general Neovim options, good to put here or in your main options file
    vim.opt.wrap = false
    vim.opt.sidescrolloff = 36 -- Set a large value

    --- Neominimap specific configuration
    ---@type Neominimap.UserConfig
    vim.g.neominimap = {
      auto_enable = false, -- THIS IS THE KEY SETTING: Minimap will not auto-enable
    }
  end,
}
