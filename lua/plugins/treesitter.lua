Add("nvim-treesitter/nvim-treesitter")
Now(function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "typescript", "html", "css", "lua" },
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	})
end)