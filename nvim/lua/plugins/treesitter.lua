return {
    {
        "nvim-treesitter/nvim-treesitter",
        -- The run command is important to ensure all parsers are installed/updated.
        run = ":TSUpdate",
        opts = {
            -- List of all required parsers for your use cases
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
                -- New languages for your diverse work:
                "cpp", -- C++ (Embedded, Kernel, Backend)
                "c", -- C (Embedded, Kernel)
                "rust", -- Rust (Similar to C/C++)
                "go", -- Go (Backend)
                "cmake", -- Build systems
                "html", -- Frontend web
                "css", -- Frontend web
                "java", -- Java (Backend)
                "c_sharp", -- C# (Backend)
                "jsonc", -- Configuration files
            },
            filetype_to_parsername = {
                -- Treat Arduino/PlatformIO files as C++
                ["ino"] = "cpp",
            },
            highlight = {
                enable = true, -- Ensure highlighting is enabled
            },
            indent = {
                enable = true, -- Enable indentation based on tree-sitter
            }
            -- Other configurations like incremental selection can be added here
        },
    },
}
