return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        ts_ls = {},
        clangd = {},
        rust_analyzer = {},
      },
    },
  },
}
