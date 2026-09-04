return {
	{
		"oskarnurm/koda.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("koda").setup({
				theme = { dark = "moss", light = "light" },
			})
			vim.cmd.colorscheme("koda")
		end,
	},
	{
		"f-person/auto-dark-mode.nvim",
		opts = {
			update_interval = 3000,
			set_dark_mode = function()
				vim.o.background = "dark"
				vim.cmd.colorscheme("koda")
			end,
			set_light_mode = function()
				vim.o.background = "light"
				vim.cmd.colorscheme("koda")
			end,
		},
	},
}
