local M = {
    "j-hui/fidget.nvim",
}

function M.config()
    require("fidget").setup {
        notification = {
            window = {
                winblend = 0,
            },
        },
    }
end

return M
