local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify('packer not found !!!')
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

local packer_startup = packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- General
  use 'windwp/nvim-autopairs'
  use 'rcarriga/nvim-notify'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { "akinsho/toggleterm.nvim" }

  -- Bufferline
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use "moll/vim-bbye"

  -- Better Comments
  use {
    'numToStr/Comment.nvim',
    config = require('plugins/comment').config()
  }

  -- Trouble
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  -- Session
  use {
    'rmagatti/auto-session',
    config = require('plugins/auto-session').config()
  }

  -- Hop
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = require('plugins/hop').config()
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope-media-files.nvim'
  use {
    "AckslD/nvim-neoclip.lua",
    requires = { {'nvim-telescope/telescope.nvim'} },
    config = require('plugins/neoclip').config(),
  }

  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require('plugins/nvim-tree').config() end
  }

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "onsails/lspkind-nvim"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "quangnguyen30192/cmp-nvim-ultisnips"
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use "rafamadriz/friendly-snippets"

  -- Native LSP
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }

  --
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release' -- To use the latest release
  }
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  -- Themes
  use "projekt0n/github-nvim-theme"
  use 'folke/tokyonight.nvim'
  use "EdenEast/nightfox.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Icons
  use 'ryanoasis/vim-devicons'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

return packer_startup
