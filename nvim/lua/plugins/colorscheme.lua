return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- make sure we have true colors
      vim.o.termguicolors = true

      -- Setup tokyonight with both on_colors and on_highlights
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        terminal_colors = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },

        on_colors = function(colors)
          -- keep palette minimal / monochrome with small accents
          colors.bg = "NONE"
          colors.fg = "#F5F5F5"
          colors.comment = "#7A7A7A"
          colors.keyword = "#FFD700"
          colors.error = "#E74C3C"
          colors.border = "#BFAF00"
        end,

        on_highlights = function(hl, c)
          -- force important UI groups to transparent / AE86-like colors
          hl.Normal = { bg = "NONE", fg = c.fg }
          hl.NormalFloat = { bg = "NONE" }
          hl.SignColumn = { bg = "NONE" }
          hl.LineNr = { fg = "#5C5C5C", bg = "NONE" }
          hl.CursorLineNr = { fg = "#FFD700", bg = "NONE", bold = true }
          hl.FloatBorder = { fg = "#FFD700", bg = "NONE" }
          hl.Pmenu = { bg = "NONE" }
          hl.PmenuSel = { bg = "NONE", underline = true }
          hl.StatusLine = { bg = "NONE", fg = c.fg }
          hl.StatusLineNC = { bg = "NONE", fg = "#9E9E9E" }
          hl.Visual = { bg = "#2A2A2A" }
          hl.CursorLine = { bg = "#1E1E1E" }

          -- syntax
          hl.Comment = { fg = "#7A7A7A", italic = true }
          hl.Keyword = { fg = "#FFD700", bold = true }
          hl.Statement = { fg = "#FFD700" }
          hl.String = { fg = "#B0B0B0" }
          hl.Error = { fg = "#E74C3C", bold = true }
          hl.Warning = { fg = "#E67E22" }
        end,
      })

      -- apply colorscheme
      vim.cmd("colorscheme tokyonight")

      -- extra safety: force bg=NONE for groups that often get reset later
      local force_none =
        { "Normal", "NormalFloat", "SignColumn", "LineNr", "CursorLine", "Pmenu", "StatusLine", "StatusLineNC" }
      for _, g in ipairs(force_none) do
        vim.api.nvim_set_hl(0, g, { bg = "NONE" })
      end

      -- keep forcing none if some plugin later changes the colorscheme
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          for _, g in ipairs(force_none) do
            vim.api.nvim_set_hl(0, g, { bg = "NONE" })
          end
        end,
      })
    end,
  },
}
