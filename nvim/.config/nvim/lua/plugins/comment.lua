local M = {
    "numToStr/Comment.nvim",
    keys = { "gc", "gb" },
    event = "BufReadPre"
}

function M.config()
require("Comment").setup()
end

return M
