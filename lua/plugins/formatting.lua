return {
	"stevearc/conform.nvim",
	config = function()
		local js = { "biome", "prettierd", "prettier", stop_after_first = true }
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang-format" },
				python = { "black" },
				zig = { "zigfmt" },
				lua = { "stylua" },
				javascript = js,
				typescript = js,
				javascriptreact = js,
				typescriptreact = js,
				astro = js,
				svelte = js,
				html = js,
				asm = { "asmfmt" },
				json = js,
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
