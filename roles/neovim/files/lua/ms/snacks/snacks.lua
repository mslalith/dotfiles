local M = {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    ---@type snacks.Config
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
        image = {
            doc = {
                enabled = false,
                inline = false,
                float = true,
            },
        },
        input = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        toggle = { enabled = true },
        terminal = {
            win = {
                border = "rounded",
            },
        },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
    keys = {
        --------------------------------------
        -- LSP
        --------------------------------------
        { "gr", "<cmd>lua require('snacks').picker.lsp_references()<cr>", nowait = true, desc = "References" },
        { "gd", "<cmd>lua require('snacks').picker.lsp_definitions()<cr>", desc = "Goto Definition" },
        { "gD", "<cmd>lua require('snacks').picker.lsp_declarations()<cr>", desc = "Goto Declaration" },
        { "gI", "<cmd>lua require('snacks').picker.lsp_implementations()<cr>", desc = "Goto Implementation" },
        -- { "<leader>a", "<cmd>lua require('snacks').picker.lsp_symbols()<cr>", desc = "LSP Symbols" },
        {
            "<leader>a",
            function()
                local layout = MsConfig.snacks.layouts.vscode_bordered
                layout = vim.tbl_deep_extend("force", layout, { preview = "main" })
                Snacks.picker.lsp_symbols { layout = layout }
            end,
            "LSP Symbols",
        },

        --------------------------------------
        -- Notifications
        --------------------------------------
        { "<leader>ns", "<cmd>lua require('snacks').notifier.show_history()<cr>", desc = "Notification History" },
        { "<leader>nh", "<cmd>lua require('snacks').notifier.hide()<cr>", desc = "Hide notifications" },

        --------------------------------------
        -- Other
        --------------------------------------
        {
            "<leader>:",
            function()
                Snacks.picker.command_history { layout = MsConfig.snacks.layouts.vscode_bordered }
            end,
            desc = "Command History",
        },
        { "<leader>w", "<cmd>lua require('snacks').bufdelete()<cr>", desc = "Delete Buffer" },
        { "<leader>ii", "<cmd>lua require('snacks').image.hover()<cr>", desc = "Show image at cursor" },
        {
            "<leader>ty",
            function()
                MsConfig.snacks.yazi()
            end,
            desc = "Yazi",
        },
    },
}

return M
