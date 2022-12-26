local M = {
    "chentoast/marks.nvim",
    event = "BufReadPre",
}

function M.config()
    require("marks").setup()
end

return M
