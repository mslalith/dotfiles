local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
        fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("packer not found !!!")
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
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")

    -- General
    use("kyazdani42/nvim-tree.lua") -- file explorer
    use("windwp/nvim-autopairs") -- autopairs
    use("rcarriga/nvim-notify") -- neat notification manager
    use("nvim-lualine/lualine.nvim") -- better status line
    use("akinsho/toggleterm.nvim") -- floating terminal
    use("stevearc/aerial.nvim") -- code outline symbols, also has Telescope support
    use("rmagatti/auto-session") -- saves state on quit
    use("xiyaowong/nvim-transparent") -- transparent background
    use("lewis6991/impatient.nvim") -- improve startup time
    use("AckslD/nvim-neoclip.lua") -- clipboard manager

    -- Bufferline
    use("akinsho/bufferline.nvim") -- buffers
    use("moll/vim-bbye") -- delete & close buffers

    -- Editing
    use("phaazon/hop.nvim") -- easy editor navigation
    use("numToStr/Comment.nvim") -- better comments

    -- Telescope
    use("nvim-telescope/telescope.nvim") -- find, search, etc
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    } -- fuzzy search
    use("nvim-telescope/telescope-media-files.nvim") -- browser media files

    -- Completion
    use("hrsh7th/nvim-cmp") -- code completion
    use("onsails/lspkind-nvim") -- vscode-like pictograms
    use("hrsh7th/cmp-path") -- path completion
    use("hrsh7th/cmp-buffer") -- buffer completion
    use("hrsh7th/cmp-nvim-lsp") -- lsp completion
    use("hrsh7th/cmp-nvim-lua") -- better lua completion

    -- Snippets
    use("quangnguyen30192/cmp-nvim-ultisnips")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    -- Native LSP
    use("neovim/nvim-lspconfig") -- LSP configuration
    use("williamboman/mason.nvim") -- package manager for LSP, DAP, Linters, Formatters
    use("williamboman/mason-lspconfig.nvim") -- easier integration with LSP
    use("folke/trouble.nvim") -- pretty diagnostics & more, also has Telescope support
    use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics, formatting
    use("https://git.sr.ht/~whynothugo/lsp_lines.nvim") -- pretty inline diagnostics

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    } -- Abstract Syntax Tree

    -- Git
    use("lewis6991/gitsigns.nvim") -- blame, hunks, git diagnostics, etc
    use("sindrets/diffview.nvim") -- diff files

    -- Themes
    use("projekt0n/github-nvim-theme")
    use("folke/tokyonight.nvim")
    use("EdenEast/nightfox.nvim")
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        run = ":CatppuccinCompile",
    }

    -- Icons
    use("ryanoasis/vim-devicons")
    use("kyazdani42/nvim-web-devicons")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)

return packer_startup
