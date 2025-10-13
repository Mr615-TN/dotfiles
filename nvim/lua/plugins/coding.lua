return {
  -- blink.cmp configuration
  {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = "rafamadriz/friendly-snippets",
    -- The `cargo build --release` step is necessary for the plugin to work,
    -- as it has a Rust component. It should not be removed.
    build = "cargo build --release",
    opts = {
      keymap = { preset = "default" },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },

    -- This function runs *after* the plugin is loaded but *before* it is fully set up.
    -- It directly overrides the 'fuzzy' module to prevent the database from being created.
    config = function(_, opts)
      -- Load the blink.cmp module
      local blink_cmp = require("blink.cmp")

      -- Check if the fuzzy module exists before trying to patch it
      if pcall(require, "blink.cmp.fuzzy") then
        local fuzzy = require("blink.cmp.fuzzy")
        -- Override the 'init_db' function with a blank one to prevent the error
        fuzzy.init_db = function() end
      end

      -- Now, set up the plugin with the rest of your options
      blink_cmp.setup(opts)
    end,

    -- opts_extend is not necessary here because we are using a custom config function
  },

  -- render-markdown.nvim configuration
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-mini/mini.nvim", -- Use mini.nvim for icons
    },
    config = function()
      require("render-markdown").setup({
        completions = {
          blink = {
            enabled = true,
          },
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
    config = function()
      -- Minimal setup for mini.nvim if you only need it for icons
    end,
  },
}
