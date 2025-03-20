return {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        return {
            use_default_keymaps = false,
            langs = {
                lua = require("treesj.langs.lua"),
                dart = require("treesj.langs.dart"),
            },
        }
    end,
}
