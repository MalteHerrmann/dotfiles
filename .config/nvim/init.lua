-- require configuration
require("config.lazy")

-- enable native LSP
vim.lsp.enable({
	"buf",
	"gopls",
	"rust-analyzer",
	-- "solidity_language_server",
	"solidity_ls_nomicfoundation",
	"ts_ls",
})
