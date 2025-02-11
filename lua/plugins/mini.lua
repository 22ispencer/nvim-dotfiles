return {
	{ "echasnovski/mini.extra", opts = {} },
	{ "echasnovski/mini.misc", opts = {} },
	{
		"echasnovski/mini.ai",
		dependencies = { "echasnovski/mini.extra" },
		config = function()
			local extra = require("mini.extra")
			require("mini.ai").setup({
				custom_textobjects = {
					B = extra.gen_ai_spec.buffer(),
					D = extra.gen_ai_spec.diagnostic(),
					I = extra.gen_ai_spec.indent(),
					L = extra.gen_ai_spec.line(),
					N = extra.gen_ai_spec.number(),
				},
			})
		end,
	},
	{ "echasnovski/mini.align", opts = {} },
	{
		"echasnovski/mini.basics",
		opts = {
			extra_ui = true,
			mappings = {
				move_with_alt = true,
			},
		},
	},
	{ "echasnovski/mini.comment", opts = {} },
	{ "echasnovski/mini.bracketed", opts = {} },
	{ "echasnovski/mini.diff", opts = {} },
	{ "echasnovski/mini.jump", opts = {} },
	{ "echasnovski/mini.jump2d", opts = {}, enabled = false },
	{ "echasnovski/mini.pairs", opts = {} },
	{ "echasnovski/mini.splitjoin", opts = {} },
	{ "echasnovski/mini.surround", opts = {} },
	{ "echasnovski/mini.trailspace", opts = {}, keys = {}, events = { "InsertEnter" } },
	{
		"echasnovski/mini.starter",
		dependencies = {
			{ "MaximilianLloyd/ascii.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
		},
		cond = not vim.g.vscode,
		config = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniStarterOpened",
				callback = function(ev)
					vim.b[ev.buf].miniindentscope_disable = true
				end,
			})
			local starter = require("mini.starter")
			local content_type_width = function(content, section_type)
				local coords = starter.content_coords(content, section_type)
				local width = math.max(unpack(vim.tbl_map(function(c)
					local line = content[c.line][c.unit].string
					return vim.fn.strdisplaywidth(line)
				end, coords)))
				return width
			end
			starter.setup({
				header = table.concat(require("ascii").art.text.neovim.dos_rebel, "\n"),
				evaluate_single = true,
				footer = os.date(),
				items = {
					starter.sections.pick(),
					starter.sections.builtin_actions(),
				},
				content_hooks = {
					starter.gen_hook.adding_bullet("› "),
					function(content)
						-- Coords
						local header_width = content_type_width(content, "header")
						local section_width = content_type_width(content, "section")
						local item_width = content_type_width(content, "item")
						local footer_width = content_type_width(content, "footer")
						local max_width = math.max(header_width, section_width, item_width, footer_width)

						for _, line in ipairs(content) do
							if not (#line == 0 or (#line == 1 and line[1].string == "")) then
								local line_str = ""
								local line_types = {}
								for _, unit in ipairs(line) do
									line_str = line_str .. unit.string
									table.insert(line_types, unit.type)
								end
								local line_width = 0
								for _, type in ipairs(line_types) do
									if type == "item" or type == "section" then
										line_width = math.max(item_width, section_width)
									elseif type == "header" then
										line_width = header_width
									elseif type == "footer" then
										line_width = footer_width
									end
								end
								local left_pad = string.rep(" ", (max_width - line_width) * 0.5)

								table.insert(line, 1, { string = left_pad, type = "empty" })
							end
						end
						return content
					end,
					starter.gen_hook.aligning("center", "center"),
				},
			})
		end,
	},
	{
		"echasnovski/mini.clue",
		cond = not vim.g.vscode,
		config = function()
			local clue = require("mini.clue")
			clue.setup({
				triggers = {
					-- Leader triggers
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },
					{ mode = "n", keys = "<LocalLeader>" },

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
					{ mode = "n", keys = "<leader>f", desc = "+find" },
					{ mode = "n", keys = "<leader>c", desc = "+code" },
					{ mode = "n", keys = "<leader>t", desc = "+tabs" },
					-- Enhance this by adding descriptions for <Leader> mapping groups
					clue.gen_clues.builtin_completion(),
					clue.gen_clues.g(),
					clue.gen_clues.marks(),
					clue.gen_clues.registers(),
					clue.gen_clues.windows(),
					clue.gen_clues.z(),
				},
			})
		end,
	},
	{ "echasnovski/mini.icons", cond = not vim.g.vscode, opts = {} },
	{ "echasnovski/mini.indentscope", cond = not vim.g.vscode, opts = {} },
	{ "echasnovski/mini.animate", cond = not vim.g.vscode, opts = {} },
	{ "echasnovski/mini.bufremove", cond = not vim.g.vscode, opts = {} },
	{
		"echasnovski/mini.completion",
		cond = not vim.g.vscode,
		lazy = false,
		opts = {},
		keys = {
			{ "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], mode = "i", expr = true },
			{ "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], mode = "i", expr = true },
		},
	},
	{ "echasnovski/mini.cursorword", cond = not vim.g.vscode, opts = {} },
	{
		"echasnovski/mini.files",
		cond = not vim.g.vscode,
		opts = {},
		keys = {
			{
				"<leader>e",
				function()
					require("mini.files").open()
				end,
				desc = "file explorer",
			},
		},
	},
	{
		"echasnovski/mini.hipatterns",
		cond = not vim.g.vscode,
		opts = {
			highlighters = {
				-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

				-- Highlight hex color strings (`#rrggbb`) using that color
				hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
			},
		},
	},
	{
		"echasnovski/mini.notify",
		cond = not vim.g.vscode,
		config = function()
			require("mini.notify").setup({
				lsp_progress = {
					enabled = false,
				},
			})
			vim.notify = require("mini.notify").make_notify()
		end,
	},
	{
		"echasnovski/mini.pick",
		lazy = false,
		cond = not vim.g.vscode,
		config = function()
			local pick = require("mini.pick")
			pick.setup({})
			vim.ui.select = pick.ui_select
		end,
		keys = {
			{ "<leader><leader>", "<cmd>Pick buffers<cr>", desc = "find buffer" },
			{ "<leader>ff", "<cmd>Pick files<cr>", desc = "find file" },
			{ "<leader>fh", "<cmd>Pick help<cr>", desc = "find help" },
			{ "<leader>fg", "<cmd>Pick grep_live<cr>", desc = "find word (in files)" },
		},
	},
	{ "echasnovski/mini.sessions", cond = not vim.g.vscode, opts = {} },
	{
		"echasnovski/mini.snippets",
		dependencies = { "rafamadriz/friendly-snippets" },
		cond = not vim.g.vscode,
		config = function()
			local snippets = require("mini.snippets")
			snippets.setup({
				snippets = {
					snippets.gen_loader.from_lang(),
				},
			})
		end,
	},
	{ "echasnovski/mini.statusline", cond = not vim.g.vscode, opts = {} },
	{ "echasnovski/mini.tabline", cond = not vim.g.vscode, opts = {} },
}
