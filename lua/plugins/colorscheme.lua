return {
	{
		"sainnhe/sonokai",
		lazy = false,
		priority = 1000,
		init = function()
			vim.g.sonokai_enable_italic = true
			vim.g.sonokai_style = "shusia"
		end,
		config = function()
			vim.cmd.colorscheme("sonokai")
		end,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.everforest_enable_italic = true
			vim.g.everforest_background = "hard"
			-- vim.cmd.colorscheme("everforest")
		end,
	},
}
