require("plugins")
require("options")
require("keymaps")

-- Theme
require("colorscheme")
require("plugins/catppuccin")

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

-- LSP
require("plugins.mason")
require("plugins.lsp.handlers").setup()
require("plugins.lsp.null-ls")

-- Git
require("plugins.gitsigns")
