return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        ts_ls = {},
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--completion-style=detailed",
            "--header-insertion=iwyu",
            "--suggest-missing-includes",
          },
          filetypes = { "c", "cpp", "objc", "objcpp", "ino" },
        },
        rust_analyzer = {},
      },
    },
  },
  -- Add PlatformIO support
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "normen/vim-pio",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.g.pio_terminal_split = "split" -- or "vsplit" for vertical split
    end,
  },
}
