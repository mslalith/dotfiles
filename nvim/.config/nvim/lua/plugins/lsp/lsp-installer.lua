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

lspconfig.tsserver.setup(opts)

