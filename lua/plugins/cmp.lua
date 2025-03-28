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
		keymap = { preset = "default" },
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
