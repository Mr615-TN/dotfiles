return {
  {
    "RRethy/base16-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.termguicolors = true

      require("base16-colorscheme").setup({
        base00 = "#050505",
        base01 = "#0b0b0b",
        base02 = "#141414",
        base03 = "#3a3a3a",
        base04 = "#6b6b6b",
        base05 = "#d6d6d6",
        base06 = "#e6e6e6",
        base07 = "#ffffff",
        base08 = "#ff2b2b",
        base09 = "#b22222",
        base0A = "#8b0000",
        base0B = "#5f875f",
        base0C = "#6f7f7f",
        base0D = "#7a7a7a",
        base0E = "#9a3b3b",
        base0F = "#400000",
      })
    end,
  },
}

