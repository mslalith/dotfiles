local M = {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        picker = {
            enabled = true,
            sources = {
                explorer = {
                    auto_close = true,
                },
            },
            formatters = {
                file = {
                    filename_first = true,
                },
            },
        },
    },
    keys = {
        --------------------------------------
        -- Pickers
        --------------------------------------
        { "<leader>e", "<cmd>lua require('snacks').explorer()<cr>", desc = "File Explorer" },
        { "<leader>/", "<cmd>lua require('snacks').picker.grep()<cr>", desc = "Grep" },
        { "<A-S-f>", "<cmd>lua require('snacks').picker.grep()<cr>", desc = "Grep" },
        { "<leader>sg", "<cmd>lua require('snacks').picker.grep()<cr>", desc = "Grep" },
        { "<leader>sw", "<cmd>lua require('snacks').picker.grep_word()<cr>", desc = "Grep selected word" },
        { "<leader>sD", "<cmd>lua require('snacks').picker.diagnostics()<cr>", desc = "Diagnostics" },
        { "<leader>sd", "<cmd>lua require('snacks').picker.diagnostics_buffer()<cr>", desc = "Buffer diagnostics" },
        {
            "<leader>ff",
            function()
                Snacks.picker.smart { layout = MsVim.snacks.layout_vscode_bordered }
            end,
            desc = "Find Files (smart)",
        },
        {
            "<leader>fb",
            function()
                Snacks.picker.buffers { layout = MsVim.snacks.layout_vscode_bordered }
            end,
            desc = "Buffers",
        },
    },
}

return M
