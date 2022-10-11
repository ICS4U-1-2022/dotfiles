-- install new LSP setup Mason
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "pyright", "jdtls", "tsserver" }
})