local M = {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    enabled = false,
}

function M.config()
    require("illuminate").configure {
        providers = {
            "lsp",
            "treesitter",
            "regex",
        },
        delay = 120,
        filetypes_denylist = {
            "NvimTree",
            "packer",
            "Trouble",
            "toggleterm",
            "DressingSelect",
            "TelescopePrompt",
        },
    }
end

return M
