-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("n", "<A-j>", "<C-d>")
vim.keymap.set("n", "<A-k>", "<C-u>")

-- vim.keymap.set("n", "ff", "<leader>cr<CR>", { desc = "Rename" })
