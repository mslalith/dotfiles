return {
    "aaronik/treewalker.nvim",
    event = "VeryLazy",
    opts = {
        highlight = false,
    },
    keys = {
        {
            "<S-A-h>",
            "<cmd>Treewalker Left<CR>",
            mode = { "n", "v" },
            desc = "Treewalker Left",
        },
        {
            "<S-A-j>",
            "<cmd>Treewalker Down<CR>",
            mode = { "n", "v" },
            desc = "Treewalker Down",
        },
        {
            "<S-A-k>",
            "<cmd>Treewalker Up<CR>",
            mode = { "n", "v" },
            desc = "Treewalker Up",
        },
        {
            "<S-A-l>",
            "<cmd>Treewalker Right<CR>",
            mode = { "n", "v" },
            desc = "Treewalker Right",
        },
    },
}
