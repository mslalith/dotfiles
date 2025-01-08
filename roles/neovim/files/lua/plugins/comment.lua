local M = {
    "numToStr/Comment.nvim",
    keys = { "gc", "gb" },
    event = "VeryLazy",
}

function M.config()
    require("Comment").setup()
end

return M
