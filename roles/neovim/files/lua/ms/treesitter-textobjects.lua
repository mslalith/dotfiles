return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function()
        require("nvim-treesitter.configs").setup {
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]f"] = { query = "@call.outer", desc = "Next function call start" },
                    ["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
                    ["]c"] = { query = "@class.outer", desc = "Next class start" },
                },
                goto_previous_start = {
                    ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
                    ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
                    ["[c"] = { query = "@class.outer", desc = "Prev class start" },
                },
            },
        }
    end,
}
