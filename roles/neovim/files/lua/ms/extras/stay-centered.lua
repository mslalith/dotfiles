return {
    "arnamak/stay-centered.nvim",
    config = function()
        local sc = require("stay-centered")
        sc.setup {
            enabled = false,
        }
    end,
}
