local M = {
    "AckslD/nvim-neoclip.lua",
}

function M.config()
require("neoclip").setup {
    history = 1000,
    preview = true,
    keys = {
        telescope = {
            i = {
                select = "<CR>",
                paste = "<C-p>",
                paste_behind = "<C-S-p>",
                replay = "<C-q>", -- replay a macro
                delete = "<C-d>", -- delete an entry
                custom = {},
            },
            n = {
                select = "<CR>",
                paste = "p",
                --- It is possible to map to more than one key.
                -- paste = { 'p', '<C-p>' },
                paste_behind = "P",
                replay = "q",
                delete = "d",
                custom = {},
            },
        },
        fzf = {
            select = "default",
            paste = "ctrl-p",
            paste_behind = "ctrl-k",
            custom = {},
        },
    },
}
end

return M
