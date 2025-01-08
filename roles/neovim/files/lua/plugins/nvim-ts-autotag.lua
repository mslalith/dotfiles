local M = {
    "windwp/nvim-ts-autotag",
    ft = ms.filetypes.web_frontend,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
}

function M.config()
    require("nvim-ts-autotag").setup()
end

return M
