return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        dashboard = {
            sections = {
                { section = "header" },
                -- {
                --     section = "terminal",
                --     cmd = "chafa $HOME/.config/nvim/assets/panda.png --size 60x56 --format symbols --align center",
                --     height = 32,
                --     width = 56,
                -- },
                { section = "keys", gap = 1, padding = 1 },
                { section = "startup" },
            },
            preset = {
                keys = {
                    {
                        icon = MsVim.icons.ui.Search,
                        key = "f",
                        desc = "Find File",
                        action = function()
                            require("snacks").dashboard.pick("files")
                        end,
                    },
                    {
                        icon = MsVim.icons.ui.File,
                        key = "n",
                        desc = "New File",
                        action = ":ene | startinsert",
                    },
                    {
                        icon = MsVim.icons.ui.Files,
                        key = "r",
                        desc = "Recent Files",
                        action = function()
                            require("snacks").dashboard.pick("oldfiles")
                        end,
                    },
                    {
                        icon = MsVim.icons.ui.Settings,
                        key = "c",
                        desc = "Config",
                        action = function()
                            require("snacks").dashboard.pick("files", { cwd = vim.fn.stdpath("config") })
                        end,
                    },
                    {
                        icon = MsVim.icons.ui.ListOutline,
                        key = "l",
                        desc = "List Sessions",
                        action = ":SessionSearch",
                    },
                    {
                        icon = MsVim.icons.ui.Reset,
                        key = "s",
                        desc = "Restore Session",
                        action = ":SessionRestore",
                    },
                    { icon = MsVim.icons.ui.LazyVim, key = "L", desc = "Lazy", action = ":Lazy" },
                    { icon = MsVim.icons.ui.Exit, key = "q", desc = "Quit", action = ":qa" },
                },
            },
        },
    },
}
