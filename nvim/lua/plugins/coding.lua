return {
  -- Explicitly disable blink.cmp to prevent conflicts with nvim-cmp and crashing issues
  {
    "saghen/blink.cmp",
    enabled = false,
  },

  -- Stable Completion with nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",      -- LSP source
      "hrsh7th/cmp-buffer",        -- Buffer text source
      "hrsh7th/cmp-path",          -- File path source
      "L3MON4D3/LuaSnip",          -- Snippet engine
      "saadparwaiz1/cmp_luasnip",  -- Snippet source
      "onsails/lspkind.nvim",      -- Icons
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          -- Use <CR> to confirm selection and auto-trigger snippet expansion
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = lspkind.cmp_format({
            with_buffer_ft = true,
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
      })
    end,
  },

  -- Snippet engine (L3MON4D3/LuaSnip)
  {
    "L3MON4D3/LuaSnip",
    version = "2.*", -- Use latest stable release
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets", -- Snippet collection
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- Formatting with conform.nvim
  {
    "stevearc/conform.nvim",
    dependencies = { "mason-org/mason.nvim" },
    event = { "BufWritePre" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black", "isort" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        c = { "clangformat" },
        cpp = { "clangformat" },
        rust = { "rustfmt" },
        go = { "gofmt" },
        java = { "google_java_format" },
        c_sharp = { "csharpier" }, -- C# formatter
      },
    },
    init = function()
      vim.keymap.set({ "n", "v" }, "<leader>fm", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, { desc = "Format Buffer" })
    end,
  },

  -- Testing with neotest
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/nvim-nio",               -- Added: Required dependency for async I/O
      "nvim-neotest/neotest-vim-test", -- Fallback for generic runners
      "nvim-neotest/neotest-python",   -- Python (pytest, unittest)
      "haydenmeade/neotest-jest",      -- JavaScript/TypeScript/React
      "rouge8/neotest-rust",           -- Rust (Corrected Repo)
    },
    config = function()
      require("neotest").setup({
        consumers = {
          require("neotest").consumers.update_inline_results,
        },
        adapters = {
          require("neotest-python"),
          require("neotest-jest"),
          require("neotest-rust"),
        },
      })
    end,
    keys = {
      { "<leader>t", function() require("neotest").run.run() end, desc = "Run nearest test" },
      { "<leader>T", function() require("neotest").run.stop() end, desc = "Stop running tests" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Open test output" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file tests" },
    },
  },

  -- render-markdown.nvim configuration
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-mini/mini.nvim",
    },
    config = function()
      require("render-markdown").setup({
        completions = {
          -- Disabled blink completion here as we are using nvim-cmp
          blink = { enabled = false },
        },
        filetypes = {
          markdown = {},
          wiki = {},
          latex = { enabled = false },
        },
      })
    end,
  },

  -- mini.nvim for icons (dependency for render-markdown.nvim)
  {
    "nvim-mini/mini.nvim",
    version = false,
  },
}
