return {
	-- lazy.nvim
	{
		"folke/snacks.nvim",
		---@type snacks.Config
		opts = {
			scratch = {},
			terminal = {},
		},
		keys = {
			{
				"<leader>cs",
				function()
					Snacks.scratch()
				end,
			},
			{
				"<leader>ct",
				function()
					Snacks.terminal.get()
				end,
			},
		},
	},
}
