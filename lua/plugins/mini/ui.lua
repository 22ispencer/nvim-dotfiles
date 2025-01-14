require("plugins.mini.starter")
require("plugins.mini.clue")
Now(function()
	require("mini.icons").setup({})
end)
Later(function()
	require("mini.indentscope").setup({})
end)
Later(function()
	require("mini.animate").setup({})
end)
Later(function()
	require("mini.bufremove").setup({})
end)
Later(function()
	require("mini.completion").setup({})
	vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
	vim.keymap.set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
end)
Later(function()
	require("mini.cursorword").setup({})
end)
Later(function()
	require("mini.files").setup({})
	Remap({ "<leader>e", ":lua MiniFiles.open()" })
end)
Later(function()
	local hipatterns = require("mini.hipatterns")
	hipatterns.setup({
		highlighters = {
			-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

			-- Highlight hex color strings (`#rrggbb`) using that color
			hex_color = hipatterns.gen_highlighter.hex_color(),
		},
	})
end)
Later(function()
	require("mini.notify").setup({})
end)
Now(function()
	local pick = require("mini.pick")
	pick.setup({})
	vim.ui.select = pick.ui_select
	Remap({ "<leader><leader>", ":Pick buffers" })
	Remap({ "<leader>ff", ":Pick files" })
	Remap({ "<leader>fh", ":Pick help" })
end)
Now(function()
	require("mini.sessions").setup({})
end)
Later(function()
	local gen_loader = require("mini.snippets").gen_loader
	require("mini.snippets").setup({
		snippets = {
			gen_loader.from_lang(),
		},
	})
end)
Now(function()
	require("mini.statusline").setup({})
end)
Now(function()
	require("mini.tabline").setup({})
end)
