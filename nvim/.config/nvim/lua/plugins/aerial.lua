local M = {
    "stevearc/aerial.nvim",
}

function M.config()
    require("aerial").setup {
        layout = {
            min_width = 40,
        },
    }
end

return M
