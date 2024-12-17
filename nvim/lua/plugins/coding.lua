return {
  -- blink.cmp configuration
  {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = "rafamadriz/friendly-snippets",
    build = "cargo build --release",
    opts = {
      keymap = { preset = "enter" },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      -- Experimental signature help support
      -- signature = { enabled = true }
    },
    opts_extend = { "sources.default" },
  },
}
