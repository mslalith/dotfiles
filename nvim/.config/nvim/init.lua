vim.defer_fn(function()
    require("plugins/impatient")
end, 0)

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
require("plugins.lsp.nvim-navic")

-- Plugins
require("plugins/notify")
require("plugins/lualine")
require("plugins/nvim-web-devicons")
require("plugins/completion")
require("plugins/treesitter")
require("plugins/treesitter-context")
require("plugins/bufferline")
require("plugins/nvim-surround")
require("plugins/auto-session")
require("plugins/nvim-transparent")
-- require("plugins/neoscroll")
require("plugins/indent-blankline")
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
