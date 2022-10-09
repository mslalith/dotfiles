local lspsaga = require("lspsaga")

local opts = { noremap = true, silent = true }

local function map(mode, l, r)
    vim.keymap.set(mode, l, r, opts)
end

map("n", "ff", ":Lspsaga rename<CR>")
map("n", "K", ":Lspsaga hover_doc<CR>")
map("n", "<A-Enter>", ":Lspsaga code_action<CR>")
map("n", "gr", ":Lspsaga lsp_finder<CR>")
map("n", "gp", ":Lspsaga peek_definition<CR>")

lspsaga.init_lsp_saga {
    border_style = "rounded", -- "single" | "double" | "rounded" | "bold" | "plus"
    saga_winblend = 0, -- values between 0-100 (opaque to transparent)

    code_action_lightbulb = {
        enable = false,
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    rename_action_quit = "<ESC>",
    rename_in_select = true,
    symbol_in_winbar = {
        enable = false,
    },
    finder_request_timeout = 2300,
    definition_action_keys = {
        edit = "o",
        vsplit = "<C-c>v",
        split = "<C-c>i",
        tabe = "<C-c>t",
        quit = "q",
    },
}
