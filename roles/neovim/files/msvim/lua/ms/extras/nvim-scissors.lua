return {
    "chrisgrieser/nvim-scissors",
    event = "VeryLazy",
    opts = {
        snippetDir = vim.fn.stdpath("config") .. "/snippets",
        snippetSelection = {
            picker = "snacks",
        },
        jsonFormatter = "jq",
        backdrop = {
            enabled = true,
            blend = 30, -- between 0-100
        },
    },
    keys = {
        {
            "<leader>ie",
            function()
                require("scissors").editSnippet()
            end,
            desc = "Snippet: Edit",
        },
        {
            "<leader>in",
            function()
                require("scissors").addNewSnippet()
            end,
            mode = { "n", "x" },
            desc = "Snippet: Add",
        },
    },
}
