return {
	"folke/neodev.nvim",
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			plugins = { spelling = true },
			key_labels = {
				["<leader>"] = "SPC",
			},
		},
	},
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
}
