local M = {
    "folke/noice.nvim",
    dependencies = {
        "rcarriga/nvim-notify",
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
        },
        lsp_progress = {
            enabled = false,
        },
    }
end

return M
