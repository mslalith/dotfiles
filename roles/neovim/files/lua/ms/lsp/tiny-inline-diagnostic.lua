return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    opts = {
        -- "modern", "classic", "minimal", "powerline",
        -- "ghost", "simple", "nonerdfont", "amongus"
        preset = "ghost",
        transparent_bg = false,
        hi = {
            background = "None",
        },
        options = {
            multilines = {
                -- Enable multiline diagnostic messages
                enabled = false,
                -- Always show messages on all lines for multiline diagnostics
                always_show = false,
            },
            virt_texts = {
                -- Priority for virtual text display
                priority = 2048,
            },
        },
    },
    keys = {
        {
            "<leader>tdi",
            "<cmd>lua require('tiny-inline-diagnostic').toggle()<cr>",
            desc = "Toggle tiny inline diagnostics",
        },
    },
}
