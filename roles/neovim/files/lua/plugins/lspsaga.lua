local M = {
    "glepnir/lspsaga.nvim",
}

function M.config()
    ms.keys.normal_mode("ff", ":Lspsaga rename<CR>")
    ms.keys.normal_mode("K", ":Lspsaga hover_doc<CR>")
    ms.keys.normal_mode("<A-Enter>", ":Lspsaga code_action<CR>")
    ms.keys.normal_mode("gr", ":Lspsaga lsp_finder<CR>")
    ms.keys.normal_mode("gd", ":Lspsaga goto_definition<CR>")
    ms.keys.normal_mode("gp", ":Lspsaga peek_definition<CR>")
    ms.keys.normal_mode("g[", ":Lspsaga diagnostic_jump_prev<CR>")
    ms.keys.normal_mode("g]", ":Lspsaga diagnostic_jump_next<CR>")
    ms.keys.normal_mode("gl", ":Lspsaga show_line_diagnostics<CR>")

    require("lspsaga").setup {
        request_timeout = 2300,
        ui = {
            border = "rounded",
            winblend = 0,
        },
        lightbulb = {
            enable = false,
        },
        code_action = {
            keys = {
                quit = "q",
                exec = "<CR>",
            },
        },
        rename = {
            quit = "<Esc><Esc>",
            exec = "<CR>",
            in_select = true,
        },
        definition = {
            edit = "o",
            vsplit = "<C-c>v",
            split = "<C-c>i",
            tabe = "<C-c>t",
            quit = "q",
        },
    }
end

return M
