local M = {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
}

function M.config()
    require("aerial").setup {
        on_attach = function(bufnr)
            MsConfig.keys.normal("m", "<cmd>AerialNext<CR>", "Aerial Next", { buffer = bufnr })
            MsConfig.keys.normal("M", "<cmd>AerialPrev<CR>", "Aerial Previous", { buffer = bufnr })
        end,
        close_on_select = true,
        layout = {
            min_width = 40,
            default_direction = "float",
        },
        float = {
            relative = "win",
        },
    }
end

return M
