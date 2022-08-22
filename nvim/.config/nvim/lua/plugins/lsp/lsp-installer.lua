local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")
local handlers = require("plugins.lsp.handlers")

lsp_installer.setup {
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    },
  },
}

local opts = {
  on_attach = handlers.on_attach,
  capabilities = handlers.capabilities,
}

local sumneko_opts = require("plugins.lsp.settings.sumneko_lua")
lspconfig.sumneko_lua.setup(vim.tbl_deep_extend("force", sumneko_opts, opts))

lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
    opts.on_attach(client, bufnr)
  end,
  capabilities = opts.capabilities
})
