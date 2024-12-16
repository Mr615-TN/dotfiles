return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
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
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                pylint = { enabled = true, args = {} }, -- Enable pylint
                pyflakes = { enabled = false },        -- Disable pyflakes
                pycodestyle = { enabled = false },     -- Disable pycodestyle
                pylsp_mypy = { enabled = true, live_mode = false }, -- Optional: Mypy
                ruff = { enabled = true },         
              },
            },
          },
        },
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
