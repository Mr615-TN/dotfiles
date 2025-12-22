return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- True color support
      vim.o.termguicolors = true

      require("tokyonight").setup({
        style = "night",
        transparent = true,
        terminal_colors = true,

        styles = {
          sidebars = "transparent",
          floats = "transparent",
          comments = { italic = true },
          keywords = { bold = true },
        },

        -- ======================
        -- PALETTE — VOID & BLOOD
        -- ======================
        on_colors = function(c)
          c.bg         = "NONE"
          c.bg_dark    = "NONE"
          c.bg_float   = "NONE"
          c.bg_popup   = "NONE"
          c.bg_sidebar = "NONE"

          c.fg         = "#d6d6d6" -- ash white
          c.comment    = "#7a7a7a" -- cold ash
          c.keyword    = "#8b0000" -- blood
          c.operator   = "#b22222" -- bright blood
          c.error      = "#ff2b2b" -- screaming red
          c.warning    = "#b22222"
          c.border     = "#400000" -- dried blood iron
        end,

        -- ======================
        -- HIGHLIGHTS — ECLIPSE
        -- ======================
        on_highlights = function(hl, c)
          -- Core UI
          hl.Normal        = { fg = c.fg, bg = "NONE" }
          hl.NormalFloat   = { bg = "NONE" }
          hl.SignColumn    = { bg = "NONE" }

          hl.LineNr        = { fg = "#444444", bg = "NONE" }
          hl.CursorLineNr  = { fg = "#ff2b2b", bold = true }
          hl.CursorLine    = { bg = "#120000" }

          hl.FloatBorder   = { fg = "#8b0000", bg = "NONE" }
          hl.WinSeparator  = { fg = "#400000" }

          hl.Pmenu         = { bg = "NONE", fg = c.fg }
          hl.PmenuSel      = { bg = "#2a0000", fg = "#ffffff" }

          hl.StatusLine    = { bg = "NONE", fg = c.fg }
          hl.StatusLineNC  = { bg = "NONE", fg = "#666666" }

          hl.Visual        = { bg = "#2a0000" }

          -- ======================
          -- SYNTAX — CURSED STEEL
          -- ======================
          hl.Comment       = { fg = "#7a7a7a", italic = true }
          hl.Keyword       = { fg = "#8b0000", bold = true }
          hl.Statement     = { fg = "#8b0000" }
          hl.Function      = { fg = "#d6d6d6", bold = true }
          hl.String        = { fg = "#b0b0b0" }
          hl.Constant      = { fg = "#a5a5a5" }
          hl.Type          = { fg = "#9a9a9a" }

          -- Diagnostics
          hl.Error         = { fg = "#ff2b2b", bold = true }
          hl.Warning       = { fg = "#b22222" }
          hl.DiagnosticError = { fg = "#ff2b2b" }
          hl.DiagnosticWarn  = { fg = "#b22222" }
          hl.DiagnosticInfo  = { fg = "#777777" }
          hl.DiagnosticHint  = { fg = "#666666" }

          -- Git
          hl.DiffAdd       = { fg = "#5f875f" }
          hl.DiffDelete    = { fg = "#8b0000" }
          hl.DiffChange    = { fg = "#7a3b3b" }
          hl.DiffText      = { fg = "#ff2b2b", bold = true }

          -- Search
          hl.Search        = { bg = "#400000", fg = "#ffffff" }
          hl.IncSearch     = { bg = "#8b0000", fg = "#ffffff", bold = true }
        end,
      })

      -- Apply scheme
      vim.cmd("colorscheme tokyonight")

      -- ======================
      -- FORCE TRANSPARENCY
      -- ======================
      local force_none = {
        "Normal",
        "NormalFloat",
        "SignColumn",
        "LineNr",
        "CursorLine",
        "Pmenu",
        "StatusLine",
        "StatusLineNC",
        "WinSeparator",
      }

      for _, g in ipairs(force_none) do
        vim.api.nvim_set_hl(0, g, { bg = "NONE" })
      end

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

