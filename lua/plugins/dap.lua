return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
		}

		dap.configurations.rust = {
			{
				name = "",
				type = "gdb",
				request = "launch",
				program = function()
					local files = {}
					local file_str = vim.fn.system({ "fd", "." })
					for _, line in file_str:gmatch("%S+") do
						table.insert(files, line)
					end
					local executable = nil
					vim.ui.select(files, {
						prompt = "Executable to debug",
					}, function(choice)
						executable = choice
					end)
					return executable
				end,
				cwd = "${workspaceFolder}",
			},
		}
	end,
	keys = {
		{
			"<Leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
		},
		{
			"<Leader>dc",
			function()
				require("dap").continue()
			end,
		},
	},
}
