local M = {
    "glepnir/lspsaga.nvim",
}

function M.config()
    ms.keys.normal_mode("ff", ":Lspsaga rename<CR>")
    ms.keys.normal_mode("K", ":Lspsaga hover_doc<CR>")
    ms.keys.normal_mode("<A-Enter>", ":Lspsaga code_action<CR>")
    ms.keys.normal_mode("gp", ":Lspsaga peek_definition<CR>")
    ms.keys.normal_mode("gj", ":Lspsaga diagnostic_jump_next<CR>")
    ms.keys.normal_mode("gk", ":Lspsaga diagnostic_jump_prev<CR>")
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
        symbol_in_winbar = {
            enable = true,
            show_file = false,
            folder_level = 1,
        },
        -- breadcrumbs should be enabled for this feature
        outline = {
            layout = "float",
            close_after_jump = true,
            keys = {
                toggle_or_jump = "<CR>",
            },
        },
    }
end

return M
