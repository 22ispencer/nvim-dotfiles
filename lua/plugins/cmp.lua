return {
	"saghen/blink.cmp",
	dependencies = {
		"echasnovski/mini.snippets",
	},
	version = "1.*",
	build = "cargo build --release",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
			["<C-Space>"] = { "select_and_accept" },
			["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
		},
		appearance = {
			nerd_font_variant = "normal",
		},
		completion = {
			documentation = { auto_show = true },
		},
		snippets = {
			preset = "mini_snippets",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
}
