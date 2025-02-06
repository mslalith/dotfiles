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
    },
    keys = {
        -- Notifications
        { "<leader>ns", "<cmd>lua require('snacks').notifier.show_history()<cr>", desc = "Notification History" },
        { "<leader>nh", "<cmd>lua require('snacks').notifier.hide()<cr>", desc = "Hide notifications" },

        -- Pickers
        { "<leader>ff", "<cmd>lua require('snacks').picker.smart()<cr>", desc = "Smart Find Files" },
        { "<A-S-o>", "<cmd>lua require('snacks').picker.smart()<cr>", desc = "Find Files" },
        { "<leader>fb", "<cmd>lua require('snacks').picker.buffers()<cr>", desc = "Buffers" },
        { "<leader>/", "<cmd>lua require('snacks').picker.grep()<cr>", desc = "Grep" },
        { "<A-S-f>", "<cmd>lua require('snacks').picker.grep()<cr>", desc = "Grep" },
        { "<leader>fm", "<cmd>lua require('snacks').explorer()<cr>", desc = "File Explorer" },

        -- Other
        {
            "<leader>:",
            function()
                Snacks.picker.command_history {
                    name = "cmd",
                    layout = layout_vscode(),
                }
            end,
            desc = "Command History",
        },
        { "<leader>gg", "<cmd>lua require('snacks').lazygit()<cr>", desc = "Lazygit" },
        { "<leader>sde", "<cmd>lua require('snacks').dim.enable()<cr>", desc = "Enable dim" },
        { "<leader>sdd", "<cmd>lua require('snacks').dim.disable()<cr>", desc = "Disable dim" },
        { "<leader>sie", "<cmd>lua require('snacks').indent.enable()<cr>", desc = "Enable indent" },
        { "<leader>sid", "<cmd>lua require('snacks').indent.disable()<cr>", desc = "Disable indent" },
    },
}

return M
