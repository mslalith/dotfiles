return {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
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
    },
    keys = {
        { "ff", "<cmd>Lspsaga rename<CR>", desc = "Rename" },
        { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Show Documentation" },
        { "<A-Enter>", "<cmd>Lspsaga code_action<CR>", desc = "Code Actions" },
        { "gp", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },
        { "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next Diagnostic" },
        { "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Previous Diagnostic" },
        { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show Line Diagnostic" },
    },
}
