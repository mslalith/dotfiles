local M = {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-telescope/telescope-media-files.nvim",
        "stevearc/aerial.nvim",
        "AckslD/nvim-neoclip.lua",
    },
}

function M.config()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")

    telescope.setup {
        defaults = {
            prompt_prefix = "  ",
            selection_caret = " ",
            path_display = { "smart" },
            sorting_strategy = "ascending",
            layout_config = {
                prompt_position = "top",
            },
            mappings = {
                i = {
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,

                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-c>"] = actions.close,

                    ["<CR>"] = actions.select_default,
                    ["<C-x>"] = actions.select_horizontal,
                    ["<C-v>"] = actions.select_vertical,
                    ["<C-t>"] = actions.select_tab,

                    ["<Tab>"] = actions.move_selection_next,
                    ["<S-Tab>"] = actions.move_selection_previous,
                    ["<A-p>"] = action_layout.toggle_preview,

                    ["<C-u>"] = actions.preview_scrolling_up,
                    ["<C-d>"] = actions.preview_scrolling_down,

                    ["<C-_>"] = actions.which_key,
                },

                n = {
                    ["<esc>"] = actions.close,
                    ["j"] = actions.move_selection_next,
                    ["k"] = actions.move_selection_previous,
                    ["H"] = actions.move_to_top,
                    ["M"] = actions.move_to_middle,
                    ["L"] = actions.move_to_bottom,

                    ["<CR>"] = actions.select_default,
                    ["<C-x>"] = actions.select_horizontal,
                    ["<C-v>"] = actions.select_vertical,
                    ["<C-t>"] = actions.select_tab,

                    ["<Tab>"] = actions.move_selection_next,
                    ["<S-Tab>"] = actions.move_selection_previous,
                    ["<A-p>"] = action_layout.toggle_preview,

                    ["gg"] = actions.move_to_top,
                    ["G"] = actions.move_to_bottom,

                    ["<C-u>"] = actions.preview_scrolling_up,
                    ["<C-d>"] = actions.preview_scrolling_down,

                    ["?"] = actions.which_key,
                },
            },
        },
        extensions = {
            media_files = {
                -- filetypes whitelist
                -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
                filetypes = { "png", "webp", "jpg", "jpeg" },
                find_cmd = "rg", -- find command (defaults to `fd`)
            },
            aerial = {
                show_nesting = true,
            },
        },
    }

    telescope.load_extension("fzf")
    telescope.load_extension("media_files")
    telescope.load_extension("aerial")
    telescope.load_extension("neoclip")
end

return M
