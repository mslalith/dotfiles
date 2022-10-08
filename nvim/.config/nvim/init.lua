require("plugins")
require("options")
require("keymaps")

-- Theme
require("colorscheme")

-- LSP
require("plugins/mason")
require("plugins/lsp/commands")
require("plugins/lsp/handlers").setup()
require("plugins/lsp/null-ls")
require("plugins/lsp/lsp_lines")

-- Plugins
require("plugins/notify")
require("plugins/lualine")
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
require("plugins/nvim-transparent")
require("plugins/impatient")
require("plugins/neoscroll")
require("plugins/indent-blankline")
require("plugins/dressing")
require("plugins/fidget")
require("plugins/nvim-colorizer")
require("plugins/illuminate")
require("plugins/nvim-scrollbar")
require("plugins/nvim-hlslens")
require("plugins/nvim-ts-autotag")
require("plugins/leap")
require("plugins/marks")

-- Git
require("plugins/gitsigns")
