local function layout_vscode()
    return {
        preview = false,
        layout = {
            backdrop = false,
            row = 1,
            width = 0.4,
            min_width = 80,
            height = 0.4,
            border = "none",
            box = "vertical",
            { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
            { win = "list", border = "rounded" },
            { win = "preview", title = "{preview}", border = "rounded" },
        },
    }
end

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
            sources = {
                explorer = {
                    auto_close = true,
                },
            },
        },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        toggle = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },

        styles = {
            lazygit = {
                width = 0,
                height = 0,
            },
        },
    },
    keys = {
        --------------------------------------
        -- Pickers
        --------------------------------------
        { "<leader>fm", "<cmd>lua require('snacks').explorer()<cr>", desc = "File Explorer" },
        { "<leader>ff", "<cmd>lua require('snacks').picker.smart()<cr>", desc = "Smart Find Files" },
        { "<A-S-o>", "<cmd>lua require('snacks').picker.smart()<cr>", desc = "Find Files" },
        { "<leader>/", "<cmd>lua require('snacks').picker.grep()<cr>", desc = "Grep" },
        { "<A-S-f>", "<cmd>lua require('snacks').picker.grep()<cr>", desc = "Grep" },
        { "<leader>sg", "<cmd>lua require('snacks').picker.grep()<cr>", desc = "Grep" },
        { "<leader>sw", "<cmd>lua require('snacks').picker.grep_word()<cr>", desc = "Grep selected word" },
        { "<leader>sD", "<cmd>lua require('snacks').picker.diagnostics()<cr>", desc = "Diagnostics" },
        { "<leader>sd", "<cmd>lua require('snacks').picker.diagnostics_buffer()<cr>", desc = "Buffer diagnostics" },
        {
            "<leader>fb",
            function()
                Snacks.picker.buffers { layout = layout_vscode() }
            end,
            desc = "Buffers",
        },

        --------------------------------------
        -- LSP
        --------------------------------------
        { "gr", "<cmd>lua require('snacks').picker.lsp_references()<cr>", nowait = true, desc = "References" },
        { "gd", "<cmd>lua require('snacks').picker.lsp_definitions()<cr>", desc = "Goto Definition" },
        { "gD", "<cmd>lua require('snacks').picker.lsp_declarations()<cr>", desc = "Goto Declaration" },
        { "gI", "<cmd>lua require('snacks').picker.lsp_implementations()<cr>", desc = "Goto Implementation" },
        { "<leader>a", "<cmd>lua require('snacks').picker.lsp_symbols()<cr>", desc = "LSP Symbols" },

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
                Snacks.picker.command_history { layout = layout_vscode() }
            end,
            desc = "Command History",
        },
        { "<leader>gg", "<cmd>lua require('snacks').lazygit()<cr>", desc = "Lazygit" },
        { "<leader>tde", "<cmd>lua require('snacks').dim.enable()<cr>", desc = "Enable dim" },
        { "<leader>tdd", "<cmd>lua require('snacks').dim.disable()<cr>", desc = "Disable dim" },
        { "<leader>tie", "<cmd>lua require('snacks').indent.enable()<cr>", desc = "Enable indent" },
        { "<leader>tid", "<cmd>lua require('snacks').indent.disable()<cr>", desc = "Disable indent" },
    },
}

return M
