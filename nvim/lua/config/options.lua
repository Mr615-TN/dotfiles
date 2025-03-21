-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- Set options
local opt = vim.opt

-- UI Settings
opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.cursorline = true -- Highlight current line
opt.termguicolors = true -- Enable true colors
opt.signcolumn = "yes" -- Always show sign column

-- Indentation & Formatting
opt.expandtab = true -- Convert tabs to spaces
opt.shiftwidth = 4 -- Indentation width
opt.tabstop = 4 -- Number of spaces per tab
opt.smartindent = true -- Smart indentation
opt.wrap = false -- Disable line wrapping

-- Search Behavior
opt.ignorecase = true -- Case-insensitive search
opt.smartcase = true -- Case-sensitive if uppercase in search
opt.hlsearch = true -- Highlight search results
opt.incsearch = true -- Incremental search

-- Performance & Responsiveness
opt.updatetime = 300 -- Reduce delay before writing swap files
opt.timeoutlen = 500 -- Faster key sequence recognition
opt.ttimeoutlen = 10 -- Faster escape key timeout

-- Splitting Behavior
opt.splitbelow = true -- Split below instead of above
opt.splitright = true -- Split right instead of left

-- Clipboard Integration
opt.clipboard = "unnamedplus" -- Use system clipboard

-- Undo & Backup
opt.undofile = true -- Persistent undo
opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- Disable swap file
opt.swapfile = false
opt.backup = false

-- Enable mouse support
opt.mouse = "a"

-- Disable line wrapping in Markdown, but enable spell check
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
