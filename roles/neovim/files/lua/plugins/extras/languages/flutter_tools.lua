local M = {
    "akinsho/flutter-tools.nvim",
    -- lazy = false,
    ft = "dart",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "stevearc/dressing.nvim",
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
        },
    }

    -- to disable duplicate error diagnostics, not sure of the cause
    vim.diagnostic.config { virtual_text = false }
end

return M
