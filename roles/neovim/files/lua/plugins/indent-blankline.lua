local M = {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    enabled = false,
}

function M.config()
    require("ibl").setup {
        scope = { enabled = false },
    }
end

return M
