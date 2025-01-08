local M = {
    "williamboman/mason.nvim",
    dependencies = {
        "jose-elias-alvarez/null-ls.nvim",
        "lsp_lines.nvim",
        "glepnir/lspsaga.nvim",
        "j-hui/fidget.nvim",
    },
}

function M.config()
    require("mason").setup {
        ui = {
            border = "rounded",
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    }

    require("mason-lspconfig").setup {
        automatic_installation = true,
        ensure_installed = {
            "lua_ls",
            "tsserver",
            "rust_analyzer",
            "pyright",
        },
    }
end

return M
