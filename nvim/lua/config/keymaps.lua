-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

keymap.set('n', '<leader>r', 'q', { noremap = true })
keymap.set('n', '@', '@', { noremap = true })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Close all open buffers
keymap.set("n", "<leader>Q", ":bufdo bdelete<CR>")

-- Paste replace visual selection without copying it.
keymap.set("v", "p", '"_dP')

-- Easy insertion of a trailing ; or , from insert mode.
keymap.set("i", ";;", "<Esc>A;<Esc>")
keymap.set("i", ",,", "<Esc>A,<Esc>")

-- Copy entire file into systems clipboard
keymap.set("n", "<C-y>", 'gg<S-v>G"+y')

-- Reselect pasted text
keymap.set('n', 'p', 'p`[v`]')

keymap.set('n', '<leader>fp', ':let @+ = @%<CR>', { desc = "Copy current file path to clipboard" })
