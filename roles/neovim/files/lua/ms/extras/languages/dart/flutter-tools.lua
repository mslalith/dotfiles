local M = {
    "akinsho/flutter-tools.nvim",
    -- lazy = false,
    ft = "dart",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = true,
}

local dartExcludedFolders = {
    vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
    vim.fn.expand("$HOME/.pub-cache"),
    vim.fn.expand("/opt/homebrew/"),
    vim.fn.expand("$HOME/tools/flutter/"),
}

function M.config()
    require("flutter-tools").setup {
        cmd = { "dart", "language-server", "--protocol=lsp" },
        widget_guides = { enabled = true },
        lsp = {
            settings = {
                analysisExcludedFolders = dartExcludedFolders,
                updateImportsOnRename = true,
            },
            capabilities = function(config)
                config.textDocument.codeAction = {
                    codeActionLiteralSupport = {
                        codeActionKind = {
                            valueSet = {
                                "",
                                "quickfix",
                                "refactor",
                                "refactor.extract",
                                "refactor.inline",
                                "refactor.rewrite",
                                -- "source",
                                -- "source.organizeImports",
                                -- "source.fixAll",
                            },
                        },
                    },
                }

                return config
            end,
        },
    }

    Toolbox.plugins.add_plugin_commands {
        name = "Flutter",
        commands = {
            {
                name = "Run app",
                group = "Flutter",
                execute = function()
                    vim.cmd("FlutterRun")
                end,
            },
            {
                name = "Run app (Web)",
                group = "Flutter",
                execute = function()
                    vim.cmd("FlutterRun -d chrome")
                end,
            },
            {
                name = "Stop app",
                group = "Flutter",
                execute = function()
                    vim.cmd("FlutterQuit")
                end,
            },
            {
                name = "Pub Get",
                group = "Flutter",
                execute = function()
                    vim.cmd("FlutterPubGet")
                end,
            },
            {
                name = "Restart app",
                group = "Flutter",
                execute = function()
                    vim.cmd("FlutterRestart")
                end,
            },
            {
                name = "Reload app",
                group = "Flutter",
                execute = function()
                    vim.cmd("FlutterReload")
                end,
            },
            {
                name = "Toggle logs",
                group = "Flutter",
                execute = function()
                    vim.cmd("FlutterLogToggle")
                end,
            },
            {
                name = "Clear Logs",
                group = "Flutter",
                execute = function()
                    vim.cmd("FlutterLogClear")
                end,
            },
        },
    }
end

return M
