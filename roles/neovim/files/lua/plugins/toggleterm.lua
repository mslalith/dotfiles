local M = {
    "akinsho/toggleterm.nvim",
    keys = { "<C-t>", "<leader>g" },
}

function M.config()
    require("toggleterm").setup {
        size = 20,
        open_mapping = [[<C-t>]],
        shade_terminals = false,
        shading_factor = 2,
        direction = "float",
        float_opts = {
            border = "curved",
        },
    }
end

return M
