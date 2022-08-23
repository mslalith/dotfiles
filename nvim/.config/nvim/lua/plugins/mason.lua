local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Setup mason & mason-lspconfig
local servers = {
    "sumneko_lua",
    "tsserver",
    "rust_analyzer",
}

local settings = {
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
}

mason.setup(settings)
mason_lspconfig.setup {
    ensure_installed = servers,
    automatic_installation = true,
}

-- Setup individual Language Servers
local lspconfig = require("lspconfig")
local handlers = require("plugins.lsp.handlers")

local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
}

local disable_formatting = function(client)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

local auto_format_on_save = function()
    vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]])
end

mason_lspconfig.setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name)
        lspconfig[server_name].setup(opts)
    end,

    ["sumneko_lua"] = function()
        local sumneko_opts = require("plugins.lsp.settings.sumneko_lua")
        lspconfig.sumneko_lua.setup(vim.tbl_deep_extend("force", sumneko_opts, {
            on_attach = function(client, bufnr)
                disable_formatting(client)
                auto_format_on_save()
                opts.on_attach(client, bufnr)
            end,
            capabilities = opts.capabilities,
        }))
    end,

    ["tsserver"] = function()
        local tsserver_opts = require("plugins.lsp.settings.tsserver")
        lspconfig.tsserver.setup(vim.tbl_deep_extend("force", tsserver_opts, {
            on_attach = function(client, bufnr)
                disable_formatting(client)
                auto_format_on_save()
                opts.on_attach(client, bufnr)
            end,
            capabilities = opts.capabilities,
        }))
    end,

    ["rust_analyzer"] = function()
        local rust_opts = require("plugins.lsp.settings.rust")
        local rust_tools = require("rust-tools")
        rust_tools.setup(vim.tbl_deep_extend("force", rust_opts, {
            server = {
                on_attach = function(client, bufnr)
                    disable_formatting(client)
                    auto_format_on_save()
                    opts.on_attach(client, bufnr)
                end,
                capabilities = opts.capabilities,
            },
        }))
    end,
}
