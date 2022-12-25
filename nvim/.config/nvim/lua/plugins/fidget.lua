local M = {
    "j-hui/fidget.nvim",
}

function M.config()
    require("fidget").setup {
        text = {
            spinner = "dots_pulse",
            done = "",
        },
        window = {
            blend = 0,
        },
    }
end

return M
