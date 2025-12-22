return {
  {
    "RRethy/base16-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.termguicolors = true
      -- still useful for floating windows
      vim.o.winblend = 20
      vim.o.pumblend = 20

      require("base16-colorscheme").setup({
        base00 = "#0c0b0d",
        base01 = "#161419",
        base02 = "#242028",
        base03 = "#3c3440",
        base04 = "#8b8490",
        base05 = "#c7c0b8",
        base06 = "#e0d9d1",
        base07 = "#f5efe7",
        base08 = "#c0392e",
        base09 = "#e55039",
        base0A = "#e67e22",
        base0B = "#5d6d47",
        base0C = "#6a7a8c",
        base0D = "#4a5568",
        base0E = "#8e44ad",
        base0F = "#922b21",
      })

      -- ███  REAL transparency  ███
      -- last two digits = alpha (00…FF).  80 ≈ 50 %, 60 ≈ 38 %, etc.
      vim.cmd("hi Normal guifg=#c7c0b8 guibg=#0c0b0d60 cterm=NONE")
    end,
  },
}
