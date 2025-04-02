return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		vim.opt.foldenable = false

		require("nvim-treesitter.configs").setup({
			ensure_installed = { "typescript", "html", "css", "lua", "markdown", "markdown_inline", "python" },
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				disable = { "latex" },
			},
		})
	end,
	build = ":TSUpdate",
}
