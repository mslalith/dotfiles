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
                    group = "stay-centered",
                    execute = function()
                        sc.toggle()
                        local msg = "stay-centered " .. (sc.cfg.enabled and "enabled" or "disabled")
                        Toolbox.notifier.info(msg)
                    end,
                },
            },
        }
    end,
}
