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
        disable = ms.plugins.nvim_tree.disabled,
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("plugins.nvim-tree")
        end,
    } -- file explorer
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        requires = { "hrsh7th/nvim-cmp" },
        disable = ms.plugins.nvim_autopairs.disabled,
        config = function()
            require("plugins.autopairs")
        end,
    } -- autopairs
    use {
        "rcarriga/nvim-notify",
        disable = ms.plugins.nvim_notify.disabled,
        config = function()
            require("plugins.notify")
        end,
    } -- neat notification manager
    use {
        "nvim-lualine/lualine.nvim",
        event = "BufReadPre",
        requires = { "kyazdani42/nvim-web-devicons" },
        disable = ms.plugins.lualine.disabled,
        config = function()
            require("plugins.lualine")
        end,
    } -- better status line
    use {
        "akinsho/toggleterm.nvim",
        keys = { "<C-t>", "<leader>g" },
        disable = ms.plugins.toggleterm.disabled,
        config = function()
            require("plugins.toggleterm")
        end,
    } -- floating terminal
    use {
        "stevearc/aerial.nvim",
        after = "telescope.nvim",
        disable = ms.plugins.aerial.disabled,
        config = function()
            require("plugins.aerial")
            require("telescope").load_extension("aerial")
        end,
    } -- code outline symbols, also has Telescope support
    use {
        "rmagatti/auto-session",
        disable = ms.plugins.auto_session.disabled,
        config = function()
            require("plugins.auto-session")
        end,
    } -- saves state on quit
    use {
        "xiyaowong/nvim-transparent",
        disable = ms.plugins.nvim_transparent.disabled,
        config = function()
            require("plugins.nvim-transparent")
        end,
    } -- transparent background
    use {
        "AckslD/nvim-neoclip.lua",
        after = "telescope.nvim",
        disable = ms.plugins.nvim_neoclip.disabled,
        config = function()
            require("plugins.neoclip")
            require("telescope").load_extension("neoclip")
        end,
    } -- clipboard manager
    use {
        "karb94/neoscroll.nvim",
        keys = { "<A-j>", "<A-k>" },
        disable = ms.plugins.neoscroll.disabled,
        config = function()
            require("plugins.neoscroll")
        end,
    } -- smooth scrolling
    use {
        "norcalli/nvim-colorizer.lua",
        event = "CursorHold",
        disable = ms.plugins.nvim_colorizer.disabled,
        config = function()
            require("plugins.nvim-colorizer")
        end,
    } -- highlight colors
    use {
        "petertriho/nvim-scrollbar",
        event = "CursorHold",
        disable = ms.plugins.nvim_scrollbar.disabled,
        config = function()
            require("plugins.nvim-scrollbar")
        end,
    } -- vertical scrollbar
    use {
        "kevinhwang91/nvim-hlslens",
        after = "nvim-scrollbar",
        disable = ms.plugins.nvim_hlslens.disabled,
        config = function()
            require("plugins.nvim-hlslens")
        end,
    } -- search highlighting

    -- Performance
    -- TODO: this plugin will be redundant once https://github.com/neovim/neovim/pull/15436 is merged
    use("lewis6991/impatient.nvim") -- improve startup time
    use {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            require("plugins.vim-startuptime")
        end,
    } -- profile startup time

    -- Bufferline
    use {
        "akinsho/bufferline.nvim",
        event = "BufReadPre",
        requires = { "kyazdani42/nvim-web-devicons" },
        disable = ms.plugins.bufferline.disabled,
        config = function()
            require("plugins.bufferline")
        end,
    } -- buffers

    -- Editing
    use {
        "phaazon/hop.nvim",
        cmd = "HopWord*",
        disable = ms.plugins.hop.disabled,
        config = function()
            require("plugins.hop")
        end,
    } -- easy editor navigation
    use {
        "ggandor/leap.nvim",
        event = "CursorHold",
        disable = ms.plugins.leap.disabled,
        config = function()
            require("plugins.leap")
        end,
    } -- quicker motion jumps
    use {
        "numToStr/Comment.nvim",
        keys = { "gc", "gb" },
        disable = ms.plugins.comment.disabled,
        config = function()
            require("plugins.comment")
        end,
    } -- better comments
    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "CursorHold",
        disable = ms.plugins.indent_blankline.disabled,
        config = function()
            require("plugins.indent-blankline")
        end,
    } -- indent guidelines
    use {
        "kylechui/nvim-surround",
        after = "nvim-treesitter",
        disable = ms.plugins.nvim_surround.disabled,
        config = function()
            require("plugins.nvim-surround")
        end,
    } -- add/update/delete surroundings
    use {
        "RRethy/vim-illuminate",
        event = "BufReadPre",
        disable = ms.plugins.vim_illuminate.disabled,
        config = function()
            require("plugins.illuminate")
        end,
    } -- highlight word under cursor
    use {
        "chentoast/marks.nvim",
        event = "BufReadPre",
        disable = ms.plugins.marks.disabled,
        config = function()
            require("plugins.marks")
        end,
    } -- manage vim marks

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        module_pattern = "telescope.*",
        cmd = "Telescope",
        disable = ms.plugins.telescope.disabled,
        config = function()
            require("plugins.telescope")
            require("telescope").load_extension("notify")
        end,
        requires = {
            { "nvim-lua/plenary.nvim" },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make",
                after = "telescope.nvim",
                disable = ms.plugins.telescope_fzf_native.disabled,
                config = function()
                    require("telescope").load_extension("fzf")
                end,
            }, -- fuzzy search
            {
                "nvim-telescope/telescope-media-files.nvim",
                after = "telescope.nvim",
                disable = ms.plugins.telescope_media_files.disabled,
                config = function()
                    require("telescope").load_extension("media_files")
                end,
            }, -- browser media files
        },
    } -- find, search, etc

    -- UI
    use {
        "stevearc/dressing.nvim",
        disable = ms.plugins.dressing.disabled,
        config = function()
            require("plugins.dressing")
        end,
    }

    -- Completion
    use {
        "onsails/lspkind-nvim",
        module = "lspkind",
        config = function()
            require("plugins.completion.lspkind")
        end,
    } -- vscode-like pictograms
    use {
        "L3MON4D3/LuaSnip",
        module = "luasnip",
        config = function()
            require("plugins.completion.luasnip")
        end,
    }
    use {
        "hrsh7th/nvim-cmp",
        disable = ms.plugins.nvim_cmp.disabled,
        after = "mason.nvim",
        config = function()
            require("plugins.completion.nvim-cmp")
        end,
    } -- code completion
    use {
        "hrsh7th/cmp-path",
        after = "nvim-cmp",
    } -- path completion
    use {
        "hrsh7th/cmp-buffer",
        after = "nvim-cmp",
    } -- buffer completion
    use {
        "hrsh7th/cmp-nvim-lsp",
        module = "cmp_nvim_lsp",
        after = "nvim-cmp",
    } -- lsp completion
    use {
        "hrsh7th/cmp-nvim-lsp-signature-help",
        after = "nvim-cmp",
    } -- lsp signature help
    use {
        "saadparwaiz1/cmp_luasnip",
        after = "nvim-cmp",
    }
    use {
        "rafamadriz/friendly-snippets",
        after = "nvim-cmp",
    }

    -- Native LSP
    use {
        "williamboman/mason.nvim",
        event = "BufReadPre",
        disable = ms.plugins.mason.disabled,
        config = function()
            require("plugins.lsp.mason")
            require("plugins.lsp.mason-lspconfig")
            require("plugins.lsp.nvim-lspconfig")
        end,
        requires = {
            { "williamboman/mason-lspconfig.nvim" },
            { "neovim/nvim-lspconfig" },
        },
    } -- package manager for LSP, DAP, Linters, Formatters
    use {
        "williamboman/mason-lspconfig.nvim",
        module = "mason-lspconfig",
    } -- easy integration with LSP
    use {
        "neovim/nvim-lspconfig",
        module_pattern = "lspconfig.*",
        requires = {
            { "hrsh7th/nvim-cmp" },
        },
    } -- LSP configuration

    use {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        disable = ms.plugins.trouble.disabled,
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("plugins.trouble")
        end,
    } -- pretty diagnostics & more, also has Telescope support
    use {
        "jose-elias-alvarez/null-ls.nvim",
        after = "mason.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        disable = ms.plugins.null_ls.disabled,
        config = function()
            require("plugins.lsp.null-ls")
        end,
    } -- LSP diagnostics, formatting
    use {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        after = "mason.nvim",
        disable = ms.plugins.lsp_lines.disabled,
        config = function()
            require("plugins.lsp.lsp_lines")
        end,
    } -- pretty inline diagnostics
    use {
        "j-hui/fidget.nvim",
        after = "mason.nvim",
        disable = ms.plugins.fidget.disabled,
        config = function()
            require("plugins.fidget")
        end,
    } -- lsp progress indicator
    use {
        "SmiteshP/nvim-navic",
        opt = true,
        module = "nvim-navic",
        disable = ms.plugins.nvim_navic.disabled,
        requires = { "neovim/nvim-lspconfig" },
        config = function()
            require("plugins.lsp.nvim-navic")
        end,
    } -- breadcrumbs
    use {
        "glepnir/lspsaga.nvim",
        after = "mason.nvim",
        disable = ms.plugins.lspsaga.disabled,
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
        disable = ms.plugins.nvim_treesitter.disabled,
        config = function()
            require("plugins.treesitter")
        end,
    } -- Abstract Syntax Tree
    use {
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
        requires = { "nvim-treesitter/nvim-treesitter" },
        disable = ms.plugins.nvim_treesitter_playground.disabled,
    }
    use {
        "nvim-treesitter/nvim-treesitter-context",
        after = "nvim-treesitter",
        disable = ms.plugins.nvim_treesitter_context.disabled,
        config = function()
            require("plugins.treesitter-context")
        end,
    } -- sticky code context
    use {
        "windwp/nvim-ts-autotag",
        ft = ms.filetypes.web_frontend,
        after = "nvim-treesitter",
        disable = ms.plugins.nvim_ts_autotag.disabled,
        config = function()
            require("plugins.nvim-ts-autotag")
        end,
    } -- auto close tags

    -- Git
    use {
        "lewis6991/gitsigns.nvim",
        event = "CursorHold",
        cond = ms.is_git_repo,
        disable = ms.plugins.gitsigns.disabled,
        config = function()
            require("plugins.gitsigns")
        end,
    } -- blame, hunks, git diagnostics, etc
    use {
        "sindrets/diffview.nvim",
        module = "diffview",
        keys = { "<leader>", "d" },
        cond = ms.is_git_repo,
        disable = ms.plugins.diffview.disabled,
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugins.diffview")
        end,
    } -- diff files

    -- Themes
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        run = ":CatppuccinCompile",
    }

    -- Icons
    use("ryanoasis/vim-devicons")
    use {
        "kyazdani42/nvim-web-devicons",
        opt = true,
        module = "nvim-web-devicons",
        config = function()
            require("plugins.nvim-web-devicons")
        end,
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)

return packer_startup
