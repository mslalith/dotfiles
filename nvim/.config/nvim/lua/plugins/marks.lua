local M = {
    "chentoast/marks.nvim",
    event = "VeryLazy",
}

function M.config()
    require("marks").setup()
end

return M
