_G.Toolbox = require("ms.toolbox.core.toolbox")

return {
    "folke/snacks.nvim",
    keys = {
        {
            "<leader>pt",
            Toolbox.general.show,
            desc = Toolbox.name,
        },
        {
            "<leader>pg",
            Toolbox.git.show,
            desc = Toolbox.name_for("Git"),
        },
        {
            "<leader>pp",
            Toolbox.plugins.show,
            desc = Toolbox.name_for("Plugin Commands"),
        },
        {
            "<leader>pd",
            Toolbox.diagnostics.show,
            desc = Toolbox.name_for("Diagnostics"),
        },
    },
}
