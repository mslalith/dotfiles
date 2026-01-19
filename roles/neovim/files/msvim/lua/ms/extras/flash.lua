local M = {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            treesitter = {
                highlight = { backdrop = true },
            },
        },
    },
    keys = {
        {
            "<leader>/",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump()
            end,
            desc = "Flash",
        },
        {
            "<leader>x",
            mode = { "n", "x", "o" },
            function()
                require("flash").treesitter()
            end,
            desc = "Flash Treesitter",
        },
    },
}

return M
