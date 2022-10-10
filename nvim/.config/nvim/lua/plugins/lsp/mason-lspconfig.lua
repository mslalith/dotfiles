local mason_lspconfig = require("mason-lspconfig")

local servers = {
    "sumneko_lua",
    "tsserver",
    "rust_analyzer",
    "pyright",
}

mason_lspconfig.setup {
    ensure_installed = servers,
    automatic_installation = true,
}
