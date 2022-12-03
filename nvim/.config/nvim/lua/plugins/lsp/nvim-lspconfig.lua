require("lspconfig.ui.windows").default_options.border = "rounded"

local function lsp_diagnostics()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    vim.diagnostic.config {
        virtual_text = true,
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }
end

local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

-- Capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local disable_formatting = function(client)
    client.server_capabilities.documentFormattingProvider = false
end

local auto_format_on_save = function()
    require("plugins.lsp.commands.auto_format_on_save").enable_auto_format()
end

local function attach_navic(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, bufnr)
    end
end

local function on_attach(client, bufnr)
    lsp_diagnostics()
    disable_formatting(client)
    auto_format_on_save()
    attach_navic(client, bufnr)
end

local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
}

mason_lspconfig.setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name)
        lspconfig[server_name].setup(opts)
    end,

    ["sumneko_lua"] = function()
        local sumneko_opts = require("plugins.lsp.providers.sumneko_lua")
        lspconfig.sumneko_lua.setup(vim.tbl_deep_extend("force", sumneko_opts, opts))
    end,

    ["tsserver"] = function()
        local tsserver_opts = require("plugins.lsp.providers.tsserver")
        lspconfig.tsserver.setup(vim.tbl_deep_extend("force", tsserver_opts, opts))
    end,

    ["rust_analyzer"] = function()
        local rust_opts = require("plugins.lsp.providers.rust")
        local rust_tools = require("rust-tools")
        rust_tools.setup(vim.tbl_deep_extend("force", rust_opts, { server = opts }))
    end,

    ["pyright"] = function()
        lspconfig.pyright.setup(vim.tbl_deep_extend("force", {}, opts))
    end,
}
