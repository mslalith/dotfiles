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
