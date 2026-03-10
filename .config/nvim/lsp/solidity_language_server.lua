---@type vim.lsp.Config
return {
	name = "Solidity Language Server",
	cmd = { "solidity-language-server" },
	root_dir = vim.fs.root(0, { "foundry.toml", ".git" }),
	filetypes = { "solidity" },
	root_markers = { "foundry.toml", ".git" },
	on_attach = function(_, _)
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = { "*.sol" },
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end,
	settings = {
		-- Settings are passed via `initializationOptions` or `didChangeConfiguration`. All settings are optional — defaults are shown below.
		["solidity-language-server"] = {
			inlayHints = {
				-- Show parameter name hints on function/event/struct calls.
				parameters = true,
				-- Show gas cost hints on functions annotated with
				-- `/// @custom:lsp-enable gas-estimates`.
				gasEstimates = true,
			},
			lint = {
				-- Master toggle for forge lint diagnostics.
				enabled = true,
				-- Filter lints by severity. Empty = all severities.
				-- Values: "high", "med", "low", "info", "gas", "code-size"
				severity = {},
				-- Run only specific lint rules by ID. Empty = all rules.
				-- Values: "incorrect-shift", "unchecked-call", "erc20-unchecked-transfer",
				--   "divide-before-multiply", "unsafe-typecast", "pascal-case-struct",
				--   "mixed-case-function", "mixed-case-variable", "screaming-snake-case-const",
				--   "screaming-snake-case-immutable", "unused-import", "unaliased-plain-import",
				--   "named-struct-fields", "unsafe-cheatcode", "asm-keccak256", "custom-errors",
				--   "unwrapped-modifier-logic"
				only = {},
				-- Suppress specific lint rule IDs from diagnostics.
				exclude = {},
			},
		},
	},
}
