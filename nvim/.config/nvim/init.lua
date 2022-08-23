require("plugins")
require("options")
require("keymaps")

-- Theme
require("colorscheme")
require("plugins/catppuccin")

-- LSP
require("plugins.mason")
require("plugins.lsp.commands")
require("plugins.lsp.handlers").setup()
require("plugins.lsp.null-ls")
require("plugins.lsp.lsp_lines")

-- Plugins
require("plugins/autopairs")
require("plugins/lualine")
require("plugins/telescope")
require("plugins/nvim-web-devicons")
require("plugins/hop")
require("plugins/completion")
require("plugins/treesitter")
require("plugins/bufferline")
require("plugins/trouble")
require("plugins/terminal")
require("plugins/comment")
require("plugins/auto-session")
require("plugins/nvim-tree")
require("plugins/aerial")
require("plugins/neoclip")
require("plugins/nvim-transparent")
require("plugins/impatient")
require("plugins/indent-blankline")
require("plugins/dressing")

-- Git
require("plugins.gitsigns")
