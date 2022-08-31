require("neoscroll").setup {
    mappings = { "<C-u>", "<C-d>", "zt", "zz", "zb" },
    easing_function = "quadratic",
}

require("neoscroll.config").set_mappings {
    ["<A-j>"] = { "scroll", { "vim.wo.scroll", "true", "350" } },
    ["<A-k>"] = { "scroll", { "-vim.wo.scroll", "true", "350" } },
}
