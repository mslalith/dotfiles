require('plugins')
require('options')
require('keymaps')
require('colorscheme')

-- Plugins
require("plugins/autopairs")
require('plugins/lualine')
require('plugins/telescope')
require('plugins/nvim-web-devicons')
require('plugins/completion')
require('plugins/treesitter')

-- LSP
require("plugins.lsp.lsp-installer")
require("plugins.lsp.handlers").setup()

