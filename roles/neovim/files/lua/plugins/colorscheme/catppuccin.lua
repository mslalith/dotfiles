local M = {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    build = ":CatppuccinCompile",
    -- enabled = false,
}

function M.config()
    vim.g["catppuccin_flavour"] = "macchiato" -- latte, frappe, macchiato, mocha

    require("catppuccin").setup {
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
            blink_cmp = true,
            native_lsp = {
                enabled = true,
            },
            notify = true,
            flash = true,
            aerial = true,
            bufferline = true,
            treesitter_context = true,
            fidget = true,
            lsp_saga = true,
        },
    }
    vim.cmd("colorscheme catppuccin")
end

return M
