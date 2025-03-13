return {
	{
		"Olical/conjure",
		ft = { "janet" },
		lazy = true,
		config = function()
			vim.g["conjure#filetype#janet"] = "conjure.client.janet.stdio"
		end,
		dependencies = {
			{
				"PaterJason/cmp-conjure",
				lazy = true,
				config = function()
					local cmp = require("cmp")
					local config = cmp.get_config()
					table.insert(config.sources, { name = "conjure" })
					return cmp.setup(config)
				end,
			},
		},
	},
}
