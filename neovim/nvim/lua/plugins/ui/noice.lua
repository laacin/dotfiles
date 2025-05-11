return {
	-- Noice
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			presets = {
				lsp_doc_border = true,
			},
			cmdline = {
				view = "cmdline",
			},
		},
	},
}
