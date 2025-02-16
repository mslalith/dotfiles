vim.g["mapleader"] = " "

require("options")
require("config")

MsConfig.keys.insert("jk", "<ESC>", "Goto normal mode")

require("keymaps")
