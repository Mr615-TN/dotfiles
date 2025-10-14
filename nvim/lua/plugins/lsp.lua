return {
  -- LSP Management (Mason)
  -- This setup ensures we explicitly manage which LSPs Mason installs.
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        "lua_ls",       -- Lua
        "pyright",      -- Python
        "clangd",       -- C/C++
        "rust_analyzer",-- Rust
        "tsserver",     -- TypeScript/JavaScript
        "html",         -- Web (HTML)
        "cssls",        -- Web (CSS)
        "gopls",        -- Go
        "jdtls",        -- Java
        "csharp_ls",    -- C#
        "dockerls",     -- Dockerfiles
        "jsonls",       -- JSON
        "yamlls",       -- YAML
      },
    },
    config = function(_, opts)
      -- Explicitly calling setup ensures Mason initializes correctly
      require("mason").setup(opts)
    end,
  },

  -- LSP Configuration (LSPConfig + Mason Bridge)
  -- NOTE: Removed `enabled = false` to activate LSP.
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPost", -- Load when a file is read
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local lsp_defaults = lspconfig.util.default_config

      -- Define common LSP attachment function with keymaps
      local on_attach = function(client, bufnr)
        if lsp_defaults.on_attach then
          lsp_defaults.on_attach(client, bufnr)
        end
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
        end

        -- Standard LSP mappings
        map("n", "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        map("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map("n", "gr", vim.lsp.buf.references, "[G]oto [R]eferences")
        map("n", "gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
        map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code [A]ction")
        map("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("n", "<leader>fD", vim.diagnostic.open_float, "Open floating diagnostic")
        map("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")
        map("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic")
      end

      -- Setup LSPs via mason-lspconfig
      require("mason-lspconfig").setup({
        handlers = {
          -- Default handler applies the common on_attach to most LSPs
          function(server_name)
            lspconfig[server_name].setup({
              on_attach = on_attach,
            })
          end,

          -- Custom setup for clangd (C/C++ needs better flags)
          ["clangd"] = function()
            lspconfig.clangd.setup({
              on_attach = on_attach,
              cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--completion-style=detailed",
                "--header-insertion=iwyu",
                "--suggest-missing-includes",
                "--malloc-trim",
                "--query-driver=/usr/bin/gcc-*,/usr/bin/clang-*",
              },
              settings = {
                clangd = {
                  fallbackFlags = { "-std=c++20", "-Wall" },
                },
              },
            })
          end,

          -- Custom setup for jdtls (Java placeholder)
          ["jdtls"] = function()
            lspconfig.jdtls.setup({
              on_attach = on_attach,
              cmd = {
                "jdtls",
              },
            })
          end,
        },
      })
    end,
  },

  -- PlatformIO support for Embedded C/C++
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "normen/vim-pio",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.g.pio_terminal_split = "split"
    end,
  },
}
