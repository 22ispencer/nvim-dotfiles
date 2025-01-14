Later(function()
	local gen_ai_spec = require("mini.extra").gen_ai_spec
	require("mini.ai").setup({
		custom_textobjects = {
			B = gen_ai_spec.buffer(),
			D = gen_ai_spec.diagnostic(),
			I = gen_ai_spec.indent(),
			L = gen_ai_spec.line(),
			N = gen_ai_spec.number(),
		},
	})
end)
Later(function()
	require("mini.align").setup({})
end)
Now(function()
	require("mini.basics").setup({
		extra_ui = true,
		mappings = {
			move_with_alt = true,
		},
	})
end)
Later(function()
	require("mini.comment").setup({})
end)
Later(function()
	require("mini.bracketed").setup({})
end)
Later(function()
	require("mini.diff").setup({})
end)
Later(function()
	require("mini.git").setup({})
end)
Later(function()
	require("mini.jump").setup({})
end)
Later(function()
	require("mini.jump2d").setup({})
end)
Later(function()
	require("mini.pairs").setup({})
end)
Later(function()
	require("mini.splitjoin").setup({})
end)
Later(function()
	require("mini.surround").setup({})
end)
Later(function()
	require("mini.trailspace").setup({})
end)
