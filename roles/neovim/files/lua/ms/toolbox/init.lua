_G.Toolbox = require("ms.toolbox.core.toolbox")

return {
    "folke/snacks.nvim",
    keys = {
        {
            "<leader>tt",
            function()
                Toolbox.show_toolbox()
            end,
            desc = Toolbox.toolbox_name,
        },
        {
            "<leader>tg",
            function()
                Toolbox.show_git_toolbox()
            end,
            desc = Toolbox.toolbox_name_for("Git"),
        },
    },
}
