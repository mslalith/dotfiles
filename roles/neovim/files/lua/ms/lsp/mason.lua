local M = {
    "williamboman/mason.nvim",
    dependencies = {
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
            -- "tsserver",
            "rust_analyzer",
            "pyright",
        },
    }

    local ensure_installed = {
        -- linters
        "luacheck", -- lua

        -- formatters
        "stylua", -- lua
        "isort",
        "black", -- python
        "rustfmt", -- rust
        "prettierd",
        "prettier", -- js, ts
    }

    local registry = require("mason-registry")
    registry.refresh(function()
        for _, name in ipairs(ensure_installed) do
            local p = registry.get_package(name)
            if not registry.is_installed(name) then
                p:install()
            else
                p:check_new_version(function(success, result_or_err)
                    if success then
                        p:install { version = result_or_err.latest_version }
                    end
                end)
            end
        end
    end)
end

return M
