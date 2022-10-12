require("ms_config")

ms.global("mapleader", " ")
ms.keys.insert_mode("jk", "<ESC>")
ms.disable_distribution_plugins()

require("plugins")
require("options")
require("keymaps")
require("colorscheme")
require("plugins.lsp.commands")
