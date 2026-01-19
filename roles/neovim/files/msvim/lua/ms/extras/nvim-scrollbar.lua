local M = {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
}

function M.config()
    require("scrollbar").setup {
        handle = {
            highlight = "PmenuSbar",
        },
    }
end

return M
