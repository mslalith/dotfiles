return {
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = function()
            vim.opt.sessionoptions = {
                "buffers",
                "curdir",
                "tabpages",
                "winsize",
                "help",
                "globals",
                "skiprtp",
                "folds",
                "winpos",
                "terminal",
            }
            return {}
        end,
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            dashboard = {
                sections = {
                    { section = "header" },
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
                            icon = MsVim.icons.ui.FileFilled,
                            key = "n",
                            desc = "New File",
                            action = ":ene | startinsert",
                        },
                        {
                            icon = " ",
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
                            action = function()
                                require("persistence").select()
                            end,
                        },
                        {
                            icon = MsVim.icons.ui.Reset,
                            key = "s",
                            desc = "Restore Sessios",
                            action = function()
                                require("persistence").load()
                            end,
                        },
                        { icon = MsVim.icons.ui.LazyVim, key = "L", desc = "Lazy", action = ":Lazy" },
                        { icon = MsVim.icons.ui.Exit, key = "q", desc = "Quit", action = ":qa" },
                    },
                },
            },
        },
    },
}
