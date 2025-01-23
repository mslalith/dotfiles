local M = {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        -- indent = { enabled = true },
        -- input = { enabled = true },
        lazygit = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        quickfile = { enabled = true },
        scroll = { enabled = true },
        -- statuscolumn = { enabled = true },
        -- words = { enabled = true },
    },
}

return M
