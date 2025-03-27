_G.Toolbox = require("ms.toolbox.core.toolbox")

return {
    "folke/snacks.nvim",
    keys = {
        {
            "<leader>tt",
            Toolbox.general.show,
            desc = Toolbox.name,
        },
        {
            "<leader>tg",
            Toolbox.git.show,
            desc = Toolbox.name_for("Git"),
        },
        {
            "<leader>tp",
            Toolbox.plugins.show,
            desc = Toolbox.name_for("Plugin Commands"),
        },
        {
            "<leader>td",
            Toolbox.diagnostics.show,
            desc = Toolbox.name_for("Diagnostics"),
        },
    },
}
