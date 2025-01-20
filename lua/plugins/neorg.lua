return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/notes",
						},
						default_workspace = "notes",
					},
				},
				["core.esupports.metagen"] = {
					config = {
						author = "Isaac Spencer",
						type = "auto",
						update_date = true,
					},
				},
				["core.export"] = {},
				["core.export.markdown"] = { config = { extensions = "all" } },
				["core.summary"] = { config = { strategy = "by_path" } },
				["core.tangle"] = {
					config = {
						report_on_empty = false,
						tangle_on_write = true,
					},
				},
				["core.ui.calendar"] = {},
				["core.journal"] = {
					config = {
						workspace = "notes",
					},
				},
				["core.qol.todo_items"] = {
					config = {
						create_todo_parents = true,
						order = {
							{ "undone", " " },
							{ "pending", "-" },
							{ "done", "x" },
						},
					},
				},
				-- make lists nicer
			},
		})

		vim.wo.foldlevel = 99
		vim.wo.conceallevel = 2
	end,
}
