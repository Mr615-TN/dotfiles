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
}
