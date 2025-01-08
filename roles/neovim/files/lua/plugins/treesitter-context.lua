local M = {
    "nvim-treesitter/nvim-treesitter-context",
}

function M.config()
    require("treesitter-context").setup {
        enable = true,
        patterns = {
            default = {
                "class",
                "function",
                "method",
            },
        },
        separator = "",
    }
end

return M
