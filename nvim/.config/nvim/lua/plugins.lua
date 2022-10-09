local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
local packer = require("packer")

-- run PackerSync on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

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
    use {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        disable = ms_config.plugins.nvim_tree.disabled,
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("plugins.nvim-tree")
        end,
    } -- file explorer
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        disable = ms_config.plugins.nvim_autopairs.disabled,
        config = function()
            require("plugins.autopairs")
        end,
    } -- autopairs
    use("rcarriga/nvim-notify") -- neat notification manager
    use("nvim-lualine/lualine.nvim") -- better status line
    use {
        "akinsho/toggleterm.nvim",
        keys = { "<C-t>", "<leader>g" },
        disable = ms_config.plugins.toggleterm.disabled,
        config = function()
            require("plugins/toggleterm")
        end,
    } -- floating terminal
    use {
        "stevearc/aerial.nvim",
        after = "telescope.nvim",
        disable = ms_config.plugins.aerial.disabled,
        config = function()
            require("plugins.aerial")
            require("telescope").load_extension("aerial")
        end,
    } -- code outline symbols, also has Telescope support
    use("rmagatti/auto-session") -- saves state on quit
    use("xiyaowong/nvim-transparent") -- transparent background
    use {
        "AckslD/nvim-neoclip.lua",
        after = "telescope.nvim",
        disable = ms_config.plugins.nvim_neoclip.disabled,
        config = function()
            require("plugins.neoclip")
            require("telescope").load_extension("neoclip")
        end,
    } -- clipboard manager
    use {
        "karb94/neoscroll.nvim",
        keys = { "<A-j>", "<A-k>" },
        disable = ms_config.plugins.neoscroll.disabled,
        config = function()
            require("plugins/neoscroll")
        end,
    } -- smooth scrolling
    use("norcalli/nvim-colorizer.lua") -- highlight colors
    use("petertriho/nvim-scrollbar") -- vertical scrollbar
    use("kevinhwang91/nvim-hlslens") -- search highlighting

    -- Performance
    use("lewis6991/impatient.nvim") -- improve startup time
    use("dstein64/vim-startuptime") -- profile startup time

    -- Bufferline
    use("akinsho/bufferline.nvim") -- buffers
    use("moll/vim-bbye") -- delete & close buffers

    -- Editing
    use {
        "phaazon/hop.nvim",
        cmd = "HopWord*",
        disable = ms_config.plugins.hop.disabled,
        config = function()
            require("plugins/hop")
        end,
    } -- easy editor navigation
    use("ggandor/leap.nvim") -- quicker motion jumps
    use {
        "numToStr/Comment.nvim",
        keys = { "gc", "gb" },
        disable = ms_config.plugins.comment.disabled,
        config = function()
            require("plugins/comment")
        end,
    } -- better comments
    use("lukas-reineke/indent-blankline.nvim") -- indent guidelines
    use("kylechui/nvim-surround") -- add/update/delete surroundings
    use("RRethy/vim-illuminate") -- highlight word under cursor
    use("chentoast/marks.nvim") -- manage vim marks

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        module = "telescope",
        cmd = "Telescope",
        disable = ms_config.plugins.telescope.disabled,
        config = function()
            require("plugins.telescope")
        end,
        requires = {
            { "nvim-lua/plenary.nvim" },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make",
                after = "telescope.nvim",
                disable = ms_config.plugins.telescope_fzf_native.disabled,
                config = function()
                    require("telescope").load_extension("fzf")
                end,
            }, -- fuzzy search
            {
                "nvim-telescope/telescope-media-files.nvim",
                after = "telescope.nvim",
                disable = ms_config.plugins.telescope_media_files.disabled,
                config = function()
                    require("telescope").load_extension("media_files")
                end,
            }, -- browser media files
        },
    } -- find, search, etc

    -- UI
    use {
        "stevearc/dressing.nvim",
        disable = ms_config.plugins.dressing.disabled,
        config = function()
            require("plugins.dressing")
        end,
    }

    -- Completion
    use("hrsh7th/nvim-cmp") -- code completion
    use("onsails/lspkind-nvim") -- vscode-like pictograms
    use("hrsh7th/cmp-path") -- path completion
    use("hrsh7th/cmp-buffer") -- buffer completion
    use("hrsh7th/cmp-nvim-lsp") -- lsp completion
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- lsp signature help

    -- Snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    -- Native LSP
    use("neovim/nvim-lspconfig") -- LSP configuration
    use("williamboman/mason.nvim") -- package manager for LSP, DAP, Linters, Formatters
    use("williamboman/mason-lspconfig.nvim") -- easier integration with LSP
    use {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        disable = ms_config.plugins.trouble.disabled,
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("plugins/trouble")
        end,
    } -- pretty diagnostics & more, also has Telescope support
    use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics, formatting
    use {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        disable = ms_config.plugins.lsp_lines.disabled,
        config = function()
            require("plugins.lsp.lsp_lines")
        end,
    } -- pretty inline diagnostics
    use("j-hui/fidget.nvim") -- lsp progress indicator
    use {
        "SmiteshP/nvim-navic",
        disable = ms_config.plugins.nvim_navic.disabled,
        requires = { "neovim/nvim-lspconfig" },
    } -- breadcrumbs
    use {
        "glepnir/lspsaga.nvim",
        disable = ms_config.plugins.lspsaga.disabled,
        config = function()
            require("plugins.lsp.lspsaga")
        end,
    }

    -- LSP servers
    use("simrat39/rust-tools.nvim") -- rust lsp

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        disable = ms_config.plugins.nvim_treesitter.disabled,
    } -- Abstract Syntax Tree
    use {
        "nvim-treesitter/nvim-treesitter-context",
        disable = ms_config.plugins.nvim_treesitter_context.disabled,
        config = function()
            require("plugins/treesitter-context")
        end,
    } -- sticky code context
    use("windwp/nvim-ts-autotag") -- auto close tags

    -- Git
    use("lewis6991/gitsigns.nvim") -- blame, hunks, git diagnostics, etc
    use {
        "sindrets/diffview.nvim",
        module = "diffview",
        keys = { "<leader>", "d" },
        disable = ms_config.plugins.diffview.disabled,
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugins.diffview")
        end,
    } -- diff files

    -- Themes
    use("projekt0n/github-nvim-theme")
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
