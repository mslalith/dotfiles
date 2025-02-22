local M = {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    ---@type snacks.Config
    opts = {
        lazygit = { enabled = true },
        picker = {
            previewers = {
                diff = { builtin = false },
                git = { builtin = false },
            },
        },
        styles = {
            ---@diagnostic disable-next-line: missing-fields
            lazygit = {
                width = 0,
                height = 0,
            },
        },
    },
    keys = {
        { "<leader>gg", "<cmd>lua require('snacks').lazygit()<cr>", desc = "Lazygit" },
        { "<leader>gb", "<cmd>lua require('snacks').git.blame_line()<cr>", desc = "Git Blame Line" },
        { "<leader>gf", "<cmd>lua require('snacks').lazygit.log_file()<cr>", desc = "Git Log File" },
        { "<leader>gl", "<cmd>lua require('snacks').picker.git_log_line()<cr>", desc = "Git Log Line" },
        {
            "<leader>gs",
            function()
                Snacks.picker.git_status { layout = MsConfig.snacks.layouts.vertical }
            end,
            desc = "Git Status",
        },
    },
}

return M
