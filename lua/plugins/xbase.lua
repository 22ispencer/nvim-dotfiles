return {
	"xbase-lab/xbase",
	dependencies = { "echasnovski/mini.pick", "neovim/nvim-lspconfig" },
	enabled = vim.loop.os_uname().sysname == "Darwin",
	opts = {
		mappings = {
			--- Open build picker. showing targets and configuration.
			build_picker = "<localleader>b", --- set to 0 to disable
			--- Open run picker. showing targets, devices and configuration
			run_picker = "<localleader>r", --- set to 0 to disable
			--- Open watch picker. showing run or build, targets, devices and configuration
			watch_picker = "<localleader>s", --- set to 0 to disable
			--- A list of all the previous pickers
			all_picker = "<localleader>ef", --- set to 0 to disable
			--- horizontal toggle log buffer
			toggle_split_log_buffer = "<localleader>ls",
			--- vertical toggle log buffer
			toggle_vsplit_log_buffer = "<localleader>lv",
		},
	},
	build = "make install",
}
