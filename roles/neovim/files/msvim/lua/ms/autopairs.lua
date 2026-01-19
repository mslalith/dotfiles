local M = {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
}

function M.config()
    require("nvim-autopairs").setup {
        check_ts = true,
        ts_config = {
            lua = { "string", "source" }, -- it will not add a pair on that treesitter node
            javascript = { "string", "template_string" },
            java = false, -- don't check treesitter on java
        },
        disable_filetype = { "TelescopePrompt", "vim" },
        fast_wrap = {
            map = "<M-e>",
            chars = { "{", "[", "(", '"', "'" },
            pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
            offset = -1, -- Offset from pattern match
            end_key = "$",
            keys = "qwertyuiopzxcvbnmasdfghjkl",
            check_comma = true,
            highlight = "Search",
            highlight_grey = "Comment",
        },
    }
end

return M
