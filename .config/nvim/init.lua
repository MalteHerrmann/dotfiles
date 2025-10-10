-- require configuration
require("config.lazy")

-- enable native LSP
vim.lsp.enable({
	"gopls",
	"rust-analyzer",
})
