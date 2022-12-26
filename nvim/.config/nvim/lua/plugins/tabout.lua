local M = {
    "abecodes/tabout.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
}

function M.config()
    require("tabout").setup {}
end

return M
