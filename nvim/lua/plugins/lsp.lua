return {
  -- Core LSP support
  {
    "neovim/nvim-lspconfig",
    enabled = true, -- was disabled!
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim", -- auto-install servers
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd", -- C/C++
          "rust_analyzer", -- Rust
          "pyright", -- Python
          "ts_ls", -- JS/TS (tsserver)
          "gopls", -- Go
          "jdtls", -- Java
        },
        automatic_installation = true,
      })

      -- One-shot setup for every server that does **not** need special init
      local lspconfig = require("lspconfig")
      local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = {
        "pyright",
        "ts_ls",
        "gopls",
        "rust_analyzer",
        "clangd",
        "jdtls",
      }
      for _, srv in ipairs(servers) do
        lspconfig[srv].setup({ capabilities = default_capabilities })
      end

      -- C/C++ extra flags (kernel/embedded friendly)
      lspconfig.clangd.setup({
        capabilities = default_capabilities,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
          "--header-insertion=iwyu",
          "--suggest-missing-includes",
        },
        filetypes = { "c", "cpp", "objc", "objcpp", "ino" },
      })

      -- Java needs a little more love
      lspconfig.jdtls.setup({
        capabilities = default_capabilities,
        root_dir = lspconfig.util.root_pattern("gradlew", ".git", "pom.xml"),
      })
    end,
  },

  -- Automatic formatter/linter installer
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- C/C++
        "clang-format",
        "cpplint",
        -- Python
        "black",
        "isort",
        "flake8",
        "mypy",
        -- JS/TS
        "prettier",
        "eslint_d",
        -- Go
        "gofumpt",
        "goimports-reviser",
        "golangci-lint",
        -- Rust
        "rustfmt",
        -- Java
        "google-java-format",
      },
    },
  },

  -- PlatformIO (embedded C/C++)
  {
    "normen/vim-pio",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.g.pio_terminal_split = "split"
    end,
  },
}
