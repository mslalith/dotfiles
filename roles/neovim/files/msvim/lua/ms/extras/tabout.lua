local M = {
    "abecodes/tabout.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "saghen/blink.cmp",
    },
}

function M.config()
    require("tabout").setup {}
end

return M
