local M = {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = {
            enabled = true,
            notify = true,
            size = 1.5 * 1024 * 1024, -- 1.5MB
        },
        dim = { enabled = true },
        indent = {
            enabled = true,
            chunk = { enabled = true },
        },
        input = { enabled = true },
        lazygit = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        picker = {
            enabled = true,
        },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        toggle = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
}

return M
