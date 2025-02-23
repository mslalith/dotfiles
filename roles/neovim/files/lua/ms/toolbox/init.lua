_G.Toolbox = require("ms.toolbox.core.toolbox")

return {
    "folke/snacks.nvim",
    keys = {
        {
            "<leader>tt",
            Toolbox.general.show,
            desc = Toolbox.toolbox_name,
        },
        {
            "<leader>tg",
            Toolbox.git.show,
            desc = Toolbox.toolbox_name_for("Git"),
        },
    },
}
