local lspsaga = require("lspsaga")

ms.keys.normal_mode("ff", ":Lspsaga rename<CR>")
ms.keys.normal_mode("K", ":Lspsaga hover_doc<CR>")
ms.keys.normal_mode("<A-Enter>", ":Lspsaga code_action<CR>")
ms.keys.normal_mode("gr", ":Lspsaga lsp_finder<CR>")
ms.keys.normal_mode("gp", ":Lspsaga peek_definition<CR>")
ms.keys.normal_mode("g[", ":Lspsaga diagnostic_jump_prev<CR>")
ms.keys.normal_mode("g]", ":Lspsaga diagnostic_jump_next<CR>")
ms.keys.normal_mode("gl", ":Lspsaga show_line_diagnostics<CR>")

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
