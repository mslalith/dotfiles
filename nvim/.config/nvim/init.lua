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
require("plugins/notify")
require("plugins/autopairs")
require("plugins/lualine")
require("plugins/telescope")
require("plugins/nvim-web-devicons")
require("plugins/hop")
require("plugins/completion")
require("plugins/treesitter")
require("plugins/treesitter-context")
require("plugins/bufferline")
require("plugins/trouble")
require("plugins/toggleterm")
require("plugins/comment")
require("plugins/nvim-surround")
require("plugins/auto-session")
require("plugins/nvim-tree")
require("plugins/aerial")
require("plugins/neoclip")
require("plugins/nvim-transparent")
require("plugins/impatient")
require("plugins/neoscroll")
require("plugins/indent-blankline")
require("plugins/dressing")
require("plugins/nvim-colorizer")

-- Git
require("plugins.gitsigns")
