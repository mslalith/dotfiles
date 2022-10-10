require("impatient").enable_profile()

require("ms_config")

ms_config.global("mapleader", " ")
ms_config.keys.insert_mode("jk", "<ESC>")

require("plugins")
require("options")
require("keymaps")

-- Theme
require("colorscheme")

-- LSP
-- require("plugins/lsp/commands")
