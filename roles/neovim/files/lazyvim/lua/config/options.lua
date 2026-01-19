-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local options = {
  foldlevel = 99, -- initial fold level when file opens
  foldmethod = "indent", -- fold method to apply
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
