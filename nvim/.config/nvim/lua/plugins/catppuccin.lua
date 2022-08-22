local catppuccin = require("catppuccin")

vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
catppuccin.setup {
    transparent_background = true,
    term_colors = true,
    compile = {
        enabled = true,
        path = vim.fn.stdpath("cache") .. "/catppuccin",
    },
    integrations = {
        gitsigns = true,
        telescope = true,
        treesitter = true,
        cmp = true,
        nvimtree = {
            enabled = true,
            show_root = true,
            transparent_panel = false,
        },
        native_lsp = {
            enabled = true,
        },
        notify = true,
        hop = true,
        aerial = true,
        bufferline = true,
    },
}
vim.cmd("colorscheme catppuccin")
