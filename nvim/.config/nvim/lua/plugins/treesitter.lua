local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
        "kylechui/nvim-surround",
        "xiyaowong/nvim-transparent",
    },
}

function M.config()
    require("nvim-treesitter.configs").setup {
        ensure_installed = { "vim", "c", "lua", "query", "rust", "java", "python", "typescript" },
        sync_install = false,
        ignore_install = { "" },
        highlight = {
            enable = true,
            disable = { "" },
            additional_vim_regex_highlighting = false,
        },
        autopairs = {
            enable = true,
        },
        autotag = {
            enable = true,
        },
        playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
            keybindings = {
                toggle_query_editor = "o",
                toggle_hl_groups = "i",
                toggle_injected_languages = "t",
                toggle_anonymous_nodes = "a",
                toggle_language_display = "I",
                focus_language = "f",
                unfocus_language = "F",
                update = "R",
                goto_node = "<cr>",
                show_help = "?",
            },
        },
    }
end

return M
