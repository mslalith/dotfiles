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

    -- nvim-hlslens integration
    require("scrollbar.handlers.search").setup()
end

return M
