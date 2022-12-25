local M = {
    "lukas-reineke/indent-blankline.nvim",
    event = "CursorHold",
}

function M.config()
    require("indent_blankline").setup {
        show_current_context = false,
        show_current_context_start = false,
    }
end

return M
