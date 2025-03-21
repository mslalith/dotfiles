local M = {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    build = ":CatppuccinCompile",
    priority = 1000,
    specs = {
        {
            "akinsho/bufferline.nvim",
            optional = true,
            opts = function(_, opts)
                if (vim.g.colors_name or ""):find("catppuccin") then
                    opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
                end
            end,
        },
    },
}

function M.config()
    vim.g["catppuccin_flavour"] = "macchiato" -- latte, frappe, macchiato, mocha

    vim.api.nvim_create_user_command("ToggleTransparency", function()
        local cat = require("catppuccin")
        cat.options.transparent_background = not cat.options.transparent_background
        cat.compile()
        vim.cmd.colorscheme(vim.g.colors_name)
    end, { desc = "Toggle catppuccin tranparency" })

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
            ufo = true,
        },
    }
    vim.cmd("colorscheme catppuccin")
end

return M
