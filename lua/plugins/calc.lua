return {
	"22ispencer/calc.nvim",
	dev = true,
	keys = { {
		"<leader>*",
		function()
			require("calc").open()
		end,
		desc = "open calc",
	} },
}
