return {
	"22ispencer/calc.nvim",
	dev = true,
	keys = { {
		"<leader>*",
		function()
			require("calc")
		end,
		desc = "open calc",
	} },
}
