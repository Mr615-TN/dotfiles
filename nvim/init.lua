-- 1. bootstrap lazy.nvim ------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- 2. personal options (extracted from your old options.lua) -------------------
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 2
vim.o.smartindent = true
vim.o.wrap = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 10
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.clipboard = "unnamedplus"
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("data") .. "/undo"
vim.o.swapfile = false
vim.o.backup = false
vim.o.mouse = "a"

-- 3. minimal plugin spec ------------------------------------------------------
require("lazy").setup({
    -- colours
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("tokyonight")
        end,
    },

    -- git client
    { "kdheepak/lazygit.nvim",   cmd = "LazyGit",   keys = { { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" } } },

    -- ai completion
    { "Exafunction/codeium.vim", event = "BufEnter" },

    -- lsp installer + configs (nvim 0.11+ API)
    {
        "williamboman/mason.nvim",
        config = function() require("mason").setup() end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = { "clangd", "rust_analyzer", "pyright", "ts_ls", "gopls", "jdtls" }
            }
        end,
    },
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
            local cap = require("cmp_nvim_lsp").default_capabilities()
            -- NEW API: vim.lsp.config + vim.lsp.enable
            vim.lsp.config("clangd", { capabilities = cap })
            vim.lsp.config("rust_analyzer", { capabilities = cap })
            vim.lsp.config("pyright", { capabilities = cap })
            vim.lsp.config("ts_ls", { capabilities = cap })
            vim.lsp.config("gopls", { capabilities = cap })
            vim.lsp.config("jdtls", { capabilities = cap })

            -- start them
            for _, server in ipairs({ "clangd", "rust_analyzer", "pyright", "ts_ls", "gopls", "jdtls" }) do
                vim.lsp.enable(server)
            end
        end,
    },
    -- snippet engine
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = "rafamadriz/friendly-snippets",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },

    -- formatting on save
    {
        "stevearc/conform.nvim",
        event = "VeryLazy",
        opts = {
            formatters_by_ft = {
                c = { "clang-format" },
                cpp = { "clang-format" },
                python = { "black", "isort" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                rust = { "rustfmt" },
                go = { "gofumpt", "goimports-reviser" },
                java = { "google-java-format" },
            },
            format_on_save = { timeout_ms = 500, lsp_fallback = true },
        },
    },

    -- fast file picker
    { "ibhagwan/fzf-lua", cmd = "FzfLua", keys = { { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" } } },

    -- status line
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("lualine").setup({
                sections = {
                    lualine_x = {
                        function()
                            return "😄"
                        end,
                    }
                },
            })
        end,
    },
}, {
    defaults = { lazy = false, version = false },
    install = { colorscheme = { "tokyonight" } },
})

-- 4. personal keymaps (extracted from your old keymaps.lua) -------------------
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("i", "jj", "<Esc>", opts)
map("n", "<C-s>", ":w<CR>", opts)
map("n", "<C-q>", ":q<CR>", opts)
map("n", "<C-a>", "ggVG", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)
map("n", "<Leader>bd", ":bd<CR>", opts)
map("n", "<Leader>ff", "<cmd>FzfLua files<cr>", opts)
map("n", "<Leader>lg", "<cmd>LazyGit<cr>", opts)
map("n", "<Esc>", ":noh<CR>", opts)
