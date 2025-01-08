local M = {
    "karb94/neoscroll.nvim",
    keys = { "{", "}" },
}

function M.config()
    require("neoscroll").setup {
        mappings = { "<C-u>", "<C-d>", "zt", "zz", "zb" },
        easing_function = "quadratic",
    }

    require("neoscroll.config").set_mappings {
        ["}"] = { "scroll", { "vim.wo.scroll", "true", "350" } },
        ["{"] = { "scroll", { "-vim.wo.scroll", "true", "350" } },
    }
end

return M
