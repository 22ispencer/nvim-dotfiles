return {

	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.sourcekit.setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						on_init = function(client)
							if client.workspace_folders then
								local path = client.workspace_folders[1].name
								if
									vim.loop.fs_stat(path .. "/.luarc.json")
									or vim.loop.fs_stat(path .. "/.luarc.jsonc")
								then
									return
								end
							end

							client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
								runtime = {
									-- Tell the language server which version of Lua you're using
									-- (most likely LuaJIT in the case of Neovim)
									version = "LuaJIT",
								},
								-- Make the server aware of Neovim runtime files
								workspace = {
									checkThirdParty = false,
									library = {
										vim.env.VIMRUNTIME,
										-- Depending on the usage, you might want to add additional paths here.
										-- "${3rd}/luv/library"
										-- "${3rd}/busted/library",
									},
									-- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
									-- library = vim.api.nvim_get_runtime_file("", true)
								},
							})
						end,
						settings = {
							Lua = {},
						},
					})
				end,
				fsautocomplete = function()
					require("lspconfig").fsautocomplete.setup({
						on_attach = function(_, bufnr)
							vim.b[bufnr].mininotify_disable = true
						end,
					})
				end,
				fennel_language_server = function()
					require("lspconfig").fennel_language_server.setup({
						filetypes = { "fennel" },
						root_dir = require("lspconfig").util.root_pattern("fnl", "lua"),
						single_file_support = true,
						settings = {
							fennel = {
								diagnostics = {
									globals = { "vim", "jit", "comment" },
								},
								workspace = { library = vim.api.nvim_list_runtime_paths() },
							},
						},
					})
				end,
			},
		},
	},
}
