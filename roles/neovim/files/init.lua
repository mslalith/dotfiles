require("ms_config")
ms.global("mapleader", " ")
ms.keys.insert_mode("jk", "<ESC>", "Goto normal mode")
ms.disable_distribution_plugins()

require("options")
require("config")

require("keymaps")
require("plugins.lsp.commands")
