require("impatient").enable_profile()

require("ms_config")

ms_config.global("mapleader", " ")
ms_config.keys.insert_mode("jk", "<ESC>")
ms_config.disable_distribution_plugins()

require("plugins")
require("options")
require("keymaps")
require("colorscheme")
require("plugins.lsp.commands")
