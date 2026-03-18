return {
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        twilight = { enabled = true }, -- This is the "auto-toggle" magic
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
  { "folke/twilight.nvim", opts = {} },
}
