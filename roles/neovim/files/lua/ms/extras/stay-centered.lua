return {
    "arnamak/stay-centered.nvim",
    event = "VeryLazy",
    config = function()
        local sc = require("stay-centered")
        sc.setup {
            enabled = false,
            skip_filetypes = { "snacks_picker_list" },
        }

        Toolbox.plugins.add_plugin_commands {
            name = "stay-centered",
            commands = {
                {
                    name = "Toggle",
                    execute = function()
                        sc.toggle()
                        local msg = sc.cfg.enabled and "Enabled" or "Disabled"
                        msg = msg .. " stay-centered"
                        Toolbox.notifier.info(msg)
                    end,
                },
            },
        }
    end,
}
