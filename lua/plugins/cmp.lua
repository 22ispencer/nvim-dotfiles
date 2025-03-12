return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"echasnovski/mini.snippets",
			"abeldekat/cmp-mini-snippets",
			"micangl/cmp-vimtex",
			"nvim-neorg/neorg",
		},
		config = function()
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
						insert({ body = args.body }) -- Insert at cursor
						cmp.resubscribe({ "TextChangedI", "TextChangedP" })
						require("cmp.config").set_onetime({ sources = {} })
					end,
				},
				mapping = {
					["<C-Space>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),

					["<Tab>"] = function(fallback)
						if not cmp.select_next_item() then
							if vim.bo.buftype ~= "prompt" and has_words_before() then
								cmp.complete()
							else
								fallback()
							end
						end
					end,

					["<S-Tab>"] = function(fallback)
						if not cmp.select_prev_item() then
							if vim.bo.buftype ~= "prompt" and has_words_before() then
								cmp.complete()
							else
								fallback()
							end
						end
					end,
				},
				sources = cmp.config.sources({
					{ name = "neorg" },
					{ name = "nvim_lsp" },
					{ name = "mini_snippets" },
					{ name = "vimtex" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
