Add({
	source = "williamboman/mason-lspconfig",
	depends = { "williamboman/mason.nvim" },
})
Later(function()
	require("mason-lspconfig").setup({
		handlers = {
			function(server_name)
				require("lspconfig")[server_name].setup({})
			end,
		},
	})
end)
