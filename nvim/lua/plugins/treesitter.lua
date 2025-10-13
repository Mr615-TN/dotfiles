return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "cpp",
        "c",
        "rust",
        "go",
        "cmake",
      },
      filetype_to_parsername = {
        ["ino"] = "cpp",
      },
      highlight = {
        enable = true, -- Ensure highlighting is enabled
      },
      -- You can add more Tree-sitter configurations here if needed
    },
  },
}
