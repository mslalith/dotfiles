local M = {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    enabled = false,
}

function M.config()
    require("marks").setup()
end

return M
