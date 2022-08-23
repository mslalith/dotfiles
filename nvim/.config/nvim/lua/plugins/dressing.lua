local dressing = require("dressing")
local telescope_themes = require("telescope.themes")

dressing.setup {
    input = {
        enabled = true,
        default_prompt = "Input:",
        prompt_align = "left", -- Can be 'left', 'right', or 'center'
        insert_only = false,
        start_in_insert = true,
        mappings = {
            n = {
                ["<Esc>"] = "Close",
                ["<CR>"] = "Confirm",
            },
            i = {
                ["<C-c>"] = "Close",
                ["<CR>"] = "Confirm",
                ["<Up>"] = "HistoryPrev",
                ["<Down>"] = "HistoryNext",
            },
        },
    },
    select = {
        enabled = true,
        backend = { "telescope" },
        telescope = telescope_themes.get_dropdown {
            initial_mode = "normal",
        },
    },
}
