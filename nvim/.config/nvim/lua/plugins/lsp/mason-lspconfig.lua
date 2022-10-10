require("mason-lspconfig").setup {
    automatic_installation = true,
    ensure_installed = {
        "sumneko_lua",
        "tsserver",
        "rust_analyzer",
        "pyright",
    },
}
