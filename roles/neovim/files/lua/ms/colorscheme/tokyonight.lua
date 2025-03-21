local M = {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = true,
    priority = 1000,
    opts = {
        transparent = true,
        styles = {
            sidebars = "transparent",
            floats = "transparent",
        },
    },
}

function M.config()
    -- tokyonight-day
    -- tokyonight-moon
    -- tokyonight-storm
    -- tokyonight-night
    vim.cmd("colorscheme tokyonight-moon")
end

return M
