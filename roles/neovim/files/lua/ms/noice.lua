local M = {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
}

function M.config()
    require("noice").setup {
        routes = {
            {
                view = "notify",
                filter = { event = "msg_showmode" },
            },
            {
                filter = {
                    event = "msg_show",
                    kind = "",
                    find = "written",
                },
                opts = { skip = true },
            },
        },
        lsp_progress = {
            enabled = false,
        },
        popupmenu = {
            enabled = true,
            backend = "cmp",
        },
        cmdline = {
            enabled = true,
            menu = "popup",
            icons = {
                ["/"] = { icon = "/", hl_group = "DiagnosticWarn" },
                ["?"] = { icon = "?", hl_group = "DiagnosticWarn" },
                [":"] = { icon = ":", hl_group = "DiagnosticInfo", firstc = false },
            },
        },
        views = {
            cmdline_popup = {
                position = {
                    row = 10,
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = "auto",
                },
            },
            popupmenu = {
                relative = "editor",
                position = {
                    row = 8,
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = 10,
                },
                border = {
                    style = "rounded",
                    padding = { 0, 1 },
                },
                win_options = {
                    winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                },
            },
        },
    }
end

return M
