vim.g["mapleader"] = " "

require("options")
require("config")

MsVim.keys.insert_mode("jk", "<ESC>", "Goto normal mode")

require("keymaps")
require("plugins.lsp.commands")
