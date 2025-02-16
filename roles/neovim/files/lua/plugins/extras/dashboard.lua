return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = function(_, opts)
        local snacks = require("snacks")
        snacks.setup(opts)

        vim.defer_fn(function()
            snacks.dashboard.update()
        end, 500)

        local checker = require("lazy.manage.checker")

        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyCheck",
            callback = function()
                for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                    if vim.api.nvim_get_option_value("filetype", { buf = bufnr }) == "snacks_dashboard" then
                        snacks.dashboard.update()
                    end
                end
            end,
        })

        checker.check()
    end,
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
                function()
                    local stats = MsConfig.plugins.stats()

                    local text = {}
                    if stats.updates > 0 then
                        local updates = MsConfig.icons.ui.Plugin .. stats.updates
                        local suffix = stats.updates == 1 and " update available" or " updates available"
                        text = {
                            { updates, hl = "special" },
                            { suffix, hl = "footer" },
                        }
                    end

                    return {
                        align = "center",
                        padding = 1,
                        text = text,
                    }
                end,
                function()
                    local version = MsConfig.nvim_version()
                    return {
                        align = "center",
                        padding = 1,
                        text = {
                            { MsConfig.icons.ui.NeoVim, hl = "footer" },
                            { version, hl = "NonText" },
                        },
                    }
                end,
            },
            preset = {
                keys = {
                    {
                        icon = MsConfig.icons.ui.Search,
                        key = "f",
                        desc = "Find File",
                        action = function()
                            require("snacks").dashboard.pick("files")
                        end,
                    },
                    {
                        icon = MsConfig.icons.ui.File,
                        key = "n",
                        desc = "New File",
                        action = ":ene | startinsert",
                    },
                    {
                        icon = MsConfig.icons.ui.Files,
                        key = "r",
                        desc = "Recent Files",
                        action = function()
                            require("snacks").dashboard.pick("oldfiles")
                        end,
                    },
                    {
                        icon = MsConfig.icons.ui.Settings,
                        key = "c",
                        desc = "Config",
                        action = function()
                            require("snacks").dashboard.pick("files", { cwd = vim.fn.stdpath("config") })
                        end,
                    },
                    {
                        icon = MsConfig.icons.ui.ListOutline,
                        key = "l",
                        desc = "List Sessions",
                        action = ":SessionSearch",
                    },
                    {
                        icon = MsConfig.icons.ui.Reset,
                        key = "s",
                        desc = "Restore Session",
                        action = ":SessionRestore",
                    },
                    { icon = MsConfig.icons.ui.LazyVim, key = "L", desc = "Lazy", action = ":Lazy" },
                    { icon = MsConfig.icons.ui.Exit, key = "q", desc = "Quit", action = ":qa" },
                },
            },
        },
    },
}
