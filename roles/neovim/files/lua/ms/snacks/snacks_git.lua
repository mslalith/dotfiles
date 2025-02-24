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
        { "<leader>gB", "<cmd>lua require('snacks').git.blame_line()<cr>", desc = "Git Blame Line" },
        { "<leader>gf", "<cmd>lua require('snacks').lazygit.log_file()<cr>", desc = "Git Log File" },
        { "<leader>gl", "<cmd>lua require('snacks').picker.git_log_line()<cr>", desc = "Git Log Line" },
        {
            "<leader>gb",
            function()
                Snacks.picker.git_branches {
                    layout = MsConfig.snacks.layouts.vscode_bordered,
                    win = {
                        input = {
                            keys = {
                                ["<c-a>"] = { "git_branch_add", mode = { "i" } },
                                ["<c-x>"] = { "git_branch_del", mode = { "i" } },
                                ["a"] = { "git_branch_add", mode = { "n" } },
                                ["x"] = { "git_branch_del", mode = { "n" } },
                            },
                        },
                    },
                }
            end,
            desc = "Git Branches",
        },
        {
            "<leader>gs",
            Toolbox.git2.check_status.show,
            desc = "Git Status",
        },
    },
}

return M
