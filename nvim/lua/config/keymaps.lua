-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Define keymap function for convenience
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- === General Keybindings ===
map("i", "jj", "<Esc>", opts) -- Exit insert mode quickly
map("n", "<C-s>", ":w<CR>", opts) -- Save file with Ctrl + S
map("n", "<C-q>", ":q<CR>", opts) -- Quit file with Ctrl + Q
map("n", "<C-a>", "ggVG", opts) -- Select all
map("n", "<C-_>", function()
  require("Comment.api").toggle.linewise.current()
end, opts)

-- === Window Navigation ===
map("n", "<C-h>", "<C-w>h", opts) -- Move to left split
map("n", "<C-l>", "<C-w>l", opts) -- Move to right split
map("n", "<C-j>", "<C-w>j", opts) -- Move to below split
map("n", "<C-k>", "<C-w>k", opts) -- Move to above split

-- === Buffer Navigation ===
map("n", "<Tab>", ":bnext<CR>", opts) -- Next buffer
map("n", "<S-Tab>", ":bprevious<CR>", opts) -- Previous buffer
map("n", "<Leader>bd", ":bd<CR>", opts) -- Close current buffer

-- === Split Window Management ===
map("n", "<Leader>sv", ":vsplit<CR>", opts) -- Vertical split
map("n", "<Leader>sh", ":split<CR>", opts) -- Horizontal split
map("n", "<Leader>sx", ":close<CR>", opts) -- Close split

--- New Pane/Buffer Creation ---
map("n", "<Leader>sn", ":new<CR>", { desc = "Create new horizontal buffer" }) -- New horizontal buffer
map("n", "<Leader>sv", ":vnew<CR>", { desc = "Create new vertical buffer" }) -- New vertical buffer
map("n", "<Leader>st", ":tabnew<CR>", { desc = "Create new tab" }) -- New tab

-- === Clipboard & Text Manipulation ===
map("v", "<Leader>y", '"+y', opts) -- Copy to system clipboard
map("n", "<Leader>p", '"+p', opts) -- Paste from system clipboard
map("n", "x", '"_x', opts) -- Delete character without copying to clipboard

-- === Indentation ===
map("v", "<", "<gv", opts) -- Indent left
map("v", ">", ">gv", opts) -- Indent right

-- === Searching ===
map("n", "n", "nzzzv", opts) -- Keep search results centered
map("n", "N", "Nzzzv", opts) -- Keep search results centered
map("n", "J", "mzJ`z", opts) -- Join lines but keep cursor position
map("n", "<Esc>", ":noh<CR>", opts) -- Clear search highlight

-- === Terminal Integration ===
-- Toggle terminal on/off
local terminal_id = 0
map("n", "<leader>tt", function()
  if terminal_id == 0 then
    -- Create a new horizontal split terminal
    vim.cmd("split term://zsh") -- You can change 'bash' to your preferred shell like 'zsh'
    terminal_id = vim.api.nvim_get_current_buf()
    vim.cmd("startinsert") -- Enter insert mode immediately in the terminal
  else
    -- Check if the terminal buffer still exists
    if vim.api.nvim_buf_is_valid(terminal_id) then
      local win_id = vim.fn.bufwinid(terminal_id)
      if win_id > 0 then
        -- If the terminal window is visible, close it
        vim.api.nvim_win_close(win_id, true)
        terminal_id = 0 -- Reset the ID
      else
        -- If the buffer exists but window is hidden, recreate it
        vim.cmd("split term://zsh")
        terminal_id = vim.api.nvim_get_current_buf()
        vim.cmd("startinsert")
      end
    else
      -- Buffer is invalid, create a new one
      vim.cmd("split term://zsh")
      terminal_id = vim.api.nvim_get_current_buf()
      vim.cmd("startinsert")
    end
  end
end, { noremap = true, silent = true, desc = "Toggle Terminal" }) -- Added desc here

-- === Terminal Mode Mappings ===
map("t", "<Esc>", "<C-\\><C-n>", opts) -- Exit terminal mode
map("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
map("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
map("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
map("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)
