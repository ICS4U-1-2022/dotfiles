local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- install new LSP setup Mason
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "pyright", "jdtls", "tsserver" }
})

-- older
-- require("user.lsp.lsp-installer")
-- require("user.lsp.handlers").setup()
