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
local lazygit = Terminal:new { cmd = "lazygit", hidden = true }

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

ms_config.keys.normal_mode("<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>")
