return {
	"stevearc/conform.nvim",
	config = function()
		local js = { "biome", "prettierd", "prettier", stop_after_first = true }
		local function swift_format_path()
			local f = assert(io.popen("xcrun --find swift-format", "r"))
			--- @type string
			local s = f:read("*a") or "swift-format"
			f:close()
			return s:match("%S+")
		end
		require("conform").setup({
			formatters = {
				prisma = {
					command = require("conform.util").from_node_modules("prisma"),
					args = { "format", "--schema", "$FILENAME" },
					stdin = false,
				},
				["clang-format"] = {
					args = "-style=Google",
				},
				swift_format = {
					command = swift_format_path(),
				},
				["clang-format"] = {
					args = "-style=Google",
				},
			},
			formatters_by_ft = {
				asm = { "asmfmt" },
				astro = js,
				c = { "clang-format" },
				cpp = { "clang-format" },
				html = js,
				lua = { "stylua" },
				javascript = js,
				javascriptreact = js,
				json = js,
				prisma = { "prisma" },
				python = { "black" },
				rust = { "rustfmt" },
				svelte = js,
				swift = { "swift_format" },
				typescript = js,
				typescriptreact = js,
				zig = { "zigfmt" },
			},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 1000 }
			end,
		})
		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
	lazy = false,
	keys = { {
		"<leader>cf",
		function()
			require("conform").format()
		end,
		desc = "format buffer",
	} },
}
