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

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new {
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = {
            border = "curved",
            width = function()
                return vim.opt.columns:get()
            end,
            height = function()
                return vim.opt.lines:get() - vim.opt.cmdheight:get()
            end,
        },
    }

    function _LAZYGIT_TOGGLE()
        lazygit:toggle()
    end

    ms.keys.normal_mode("<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>")
end

return M
