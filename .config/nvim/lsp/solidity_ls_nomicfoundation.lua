---@type vim.lsp.Config
---
---Taken from: https://github.com/neovim/nvim-lspconfig/blob/5a49a97/lsp/solidity_ls_nomicfoundation.lua
---
return {
	cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
	single_file_support = true,
	filetypes = { "solidity" },
	--- avoid auto-formatting by disabling them while attaching the LSP process
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
	root_markers = {
		"hardhat.config.js",
		"hardhat.config.ts",
		"foundry.toml",
		"remappings.txt",
		"truffle.js",
		"truffle-config.js",
		"ape-config.yaml",
		".git",
		"package.json",
	},
}
