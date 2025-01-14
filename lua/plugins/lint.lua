Add("mfussenegger/nvim-lint")
Later(function()
	require("lint").linters_by_ft = {
		javascript = { "eslint" },
	}
	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		callback = function()
			require("lint").try_lint()
		end,
	})
end)