return {
  -- Better completion sources for all languages
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets", -- huge snippet collection
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert(),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },

  -- Snippet engine
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- Automatic formatting on save
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        python = { "black", "isort" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        rust = { "rustfmt" },
        go = { "gofumpt", "goimports-reviser" },
        java = { "google-java-format" },
      },
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
    },
  },

  -- mini.nvim for icons (dependency for render-markdown.nvim)
  {
    "nvim-mini/mini.nvim",
    version = false,
    config = function() end, -- minimal setup
  },
}
