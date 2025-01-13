-- Dependencies
Add("rafamadriz/friendly-snippets")

-- Setup configuration
Now(function()
	require("mini.extra").setup({})
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
	require("mini.align").setup({})
	require("mini.basics").setup({
		extra_ui = true,
		mappings = {
			move_with_alt = true,
		},
	})
	require("mini.comment").setup({})
	require("mini.bracketed").setup({})
	require("mini.diff").setup({})
	require("mini.git").setup({})
	require("mini.icons").setup({})
	require("mini.indentscope").setup({})
	require("mini.jump").setup({})
	require("mini.jump2d").setup({})
	require("mini.misc").setup({})
	require("mini.pairs").setup({})
	require("mini.splitjoin").setup({})
	require("mini.surround").setup({})
	require("mini.trailspace").setup({})
	if not vim.g.vscode then
		require("mini.animate").setup({})
		require("mini.bufremove").setup({})
		local miniclue = require("mini.clue")
		miniclue.setup({
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- Marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- Window commands
				{ mode = "n", keys = "<C-w>" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},

			clues = {
				-- Enhance this by adding descriptions for <Leader> mapping groups
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
			},
		})
		require("mini.completion").setup({})
		vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true })
		vim.keymap.set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
		require("mini.cursorword").setup({})
		require("mini.files").setup({})
		Remap({ "<leader>e", ":lua MiniFiles.open()" })
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
		require("mini.notify").setup({})
		require("mini.pick").setup({})
		vim.ui.select = MiniPick.ui_select
		Remap({ "<leader><leader>", ":Pick buffers" })
		Remap({ "<leader>ff", ":Pick files" })
		Remap({ "<leader>fh", ":Pick help" })
		require("mini.sessions").setup({})
		local gen_loader = require("mini.snippets").gen_loader
		require("mini.snippets").setup({
			snippets = {
				gen_loader.from_lang(),
			},
		})
		require("mini.starter").setup({})
		require("mini.statusline").setup({})
		require("mini.tabline").setup({})
	end
end)
