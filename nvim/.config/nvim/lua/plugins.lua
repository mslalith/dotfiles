return {
    "nvim-lua/plenary.nvim",
    --
    --     -- UI
    --     {
    --         "stevearc/dressing.nvim",
    --         disable = ms.plugins.dressing.disabled,
    --         config = function()
    --             require("plugins.dressing")
    --         end,
    --     },
    --     {
    --         "gelguy/wilder.nvim",
    --         event = { "CmdwinEnter", "CmdlineEnter" },
    --         disable = ms.plugins.wilder.disabled,
    --         config = function()
    --             require("plugins.wilder")
    --         end,
    --     }, -- adventurous wildmenu
    --
    --
    --     -- LSP servers
    "simrat39/rust-tools.nvim", -- rust lsp
    --
    --     -- Treesitter
    --     {
    --         "windwp/nvim-ts-autotag",
    --         ft = ms.filetypes.web_frontend,
    --         after = "nvim-treesitter",
    --         disable = ms.plugins.nvim_ts_autotag.disabled,
    --         config = function()
    --             require("plugins.nvim-ts-autotag")
    --         end,
    --     }, -- auto close tags
    "ryanoasis/vim-devicons",
}
