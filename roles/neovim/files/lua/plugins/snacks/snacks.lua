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
        input = { enabled = true },
        lazygit = { enabled = true },
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

        styles = {
            ---@diagnostic disable-next-line: missing-fields
            lazygit = {
                width = 0,
                height = 0,
            },
        },
    },
    keys = {
        --------------------------------------
        -- Git
        --------------------------------------
        { "<leader>gb", "<cmd>lua require('snacks').git.blame_line()<cr>", desc = "Git Blame Line" },
        { "<leader>gl", "<cmd>lua require('snacks').picker.git_log_line()<cr>", desc = "Git Log Line" },
        { "<leader>gf", "<cmd>lua require('snacks').picker.git_log_file()<cr>", desc = "Git Log File" },

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
                local layout = MsVim.snacks.layout_vscode_bordered
                layout = vim.tbl_deep_extend("force", layout, { preview = "main" })
                Snacks.picker.lsp_symbols {
                    layout = layout,
                }
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
                Snacks.picker.command_history { layout = MsVim.snacks.layout_vscode_bordered }
            end,
            desc = "Command History",
        },
        { "<leader>gg", "<cmd>lua require('snacks').lazygit()<cr>", desc = "Lazygit" },
        { "<leader>ty", "<cmd>lua MsVim.snacks.yazi()<cr>", desc = "Yazi" },
        { "<leader>w", "<cmd>lua require('snacks').bufdelete()<cr>", desc = "Delete Buffer" },
        { "<leader>tde", "<cmd>lua require('snacks').dim.enable()<cr>", desc = "Enable dim" },
        { "<leader>tdd", "<cmd>lua require('snacks').dim.disable()<cr>", desc = "Disable dim" },
        { "<leader>tie", "<cmd>lua require('snacks').indent.enable()<cr>", desc = "Enable indent" },
        { "<leader>tid", "<cmd>lua require('snacks').indent.disable()<cr>", desc = "Disable indent" },
    },
}

return M
