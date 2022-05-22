local lsp_installer = require("nvim-lsp-installer")
local handlers = require("plugins.lsp.handlers")

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = handlers.on_attach,
		capabilities = handlers.capabilities,
	}

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("plugins.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
