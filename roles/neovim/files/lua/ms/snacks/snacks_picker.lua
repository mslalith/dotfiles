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
        { "<leader>sw", "<cmd>lua require('snacks').picker.grep_word()<cr>", desc = "Grep selected word" },
        { "<leader>sr", "<cmd>lua require('snacks').picker.resume()<cr>", desc = "Resume last picker" },
        {
            "<leader>sf",
            function()
                Snacks.picker.lines {
                    layout = vim.tbl_deep_extend(
                        "force",
                        MsConfig.snacks.layouts.vscode_bordered,
                        { preview = "main" }
                    ),
                }
            end,
            desc = "Buffer diagnostics",
        },
        {
            "<leader>sD",
            function()
                Snacks.picker.diagnostics { layout = MsConfig.snacks.layouts.vertical }
            end,
            desc = "Diagnostics",
        },
        {
            "<leader>sd",
            function()
                Snacks.picker.diagnostics_buffer { layout = MsConfig.snacks.layouts.vertical }
            end,
            desc = "Buffer diagnostics",
        },
        {
            "<leader><leader>",
            function()
                Snacks.picker.smart {
                    multi = { "buffers", "files" },
                    layout = MsConfig.snacks.layouts.vscode_bordered,
                }
            end,
            desc = "Find Files (smart)",
        },
        {
            mode = "v",
            "<leader><leader>",
            function()
                Snacks.picker.smart {
                    multi = { "buffers", "files" },
                    layout = MsConfig.snacks.layouts.vscode_bordered,
                    search = function(picker)
                        return picker:word()
                    end,
                }
            end,
            desc = "Find Files (smart)",
        },
        {
            "<leader>fr",
            function()
                Snacks.picker.recent { layout = MsConfig.snacks.layouts.vscode_bordered }
            end,
            desc = "Buffers",
        },
        {
            "<leader>fb",
            function()
                Snacks.picker.buffers { layout = MsConfig.snacks.layouts.vscode_bordered }
            end,
            desc = "Buffers",
        },
        {
            mode = "n",
            "<leader>sg",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },
        {
            mode = "n",
            "<leader>sG",
            function()
                Snacks.picker.grep_word()
            end,
            desc = "Grep",
        },
        {
            mode = "v",
            "<leader>sg",
            function()
                Snacks.picker.grep_word()
            end,
            desc = "Grep",
        },
    },
}

return M
