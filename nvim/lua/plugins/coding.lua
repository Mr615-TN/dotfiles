return {
  -- blink.cmp configuration
  {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = "rafamadriz/friendly-snippets",
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
      --providers = { -- <--- ADD THIS 'providers' TABLE HERE
      --jupynium = {
      --name = "Jupynium",
      --module = "jupynium.blink_cmp",
      --score_offset = 100, -- Adjust priority as desired
      -- },
      -- },
      -- Experimental signature help support
      -- signature = { enabled = true }
    },
    -- Keep opts_extend, though it primarily applies to 'sources.default' merging from other files
    -- For providers, they need to be defined directly here.
    opts_extend = { "sources.default" },
  },

  -- render-markdown.nvim configuration
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.nvim", -- Use mini.nvim for icons
    },
    config = function()
      require("render-markdown").setup({
        -- Configuration for markdown files
        -- You can add specific options for markdown rendering here if needed.

        -- Enable completions for blink.cmp
        completions = {
          blink = {
            enabled = true,
          },
        },

        -- Basic configuration for LaTeX files
        filetypes = {
          latex = {
            -- You can add specific options for LaTeX rendering here if render-markdown.nvim supports them.
            -- For example, if it had a 'render_command' option for LaTeX:
            -- render_command = { 'pdflatex', '-interaction=nonstopmode', '$file_name$' },
          },
        },
      })
    end,
  },

  -- mini.nvim for icons (dependency for render-markdown.nvim)
  {
    "echasnovski/mini.nvim",
    version = "*", -- Use latest stable release
    config = function()
      -- Minimal setup for mini.nvim if you only need it for icons
      -- You can configure specific mini modules here if you want to use more of its features.
    end,
  },
}
