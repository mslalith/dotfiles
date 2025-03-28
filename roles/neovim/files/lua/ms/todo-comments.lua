return {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        highlight = {
            before = "fg", -- "fg" or "bg" or empty
            keyword = "fg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty
            after = "fg", -- "fg" or "bg" or empty
        },
    },
    keys = {
        {
            "<leader>sT",
            function()
                Snacks.picker.todo_comments()
            end,
            desc = "TODO",
        },
        {
            "<leader>st",
            function()
                Snacks.picker.todo_comments { keywords = { "TODO", "FIX", "FIXME" } }
            end,
            desc = "TODO/FIX/FIXME",
        },
        {
            "]t",
            function()
                require("todo-comments").jump_next()
            end,
            desc = "Goto next TODO",
        },
        {
            "[t",
            function()
                require("todo-comments").jump_prev()
            end,
            desc = "Goto next TODO",
        },
    },
}
