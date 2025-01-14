-- Put this at the top of 'init.lua'
local path_package = vim.fn.stdpath("data") .. "/site"
local mini_path = path_package .. "/pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		"git",
		"clone",
		"--filter=blob:none",
		-- Uncomment next line to use 'stable' branch
		-- '--branch', 'stable',
		"https://github.com/echasnovski/mini.nvim",
		mini_path,
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
end

local deps = require("mini.deps")
deps.setup({})

vim.g.mapleader = " "
Add = deps.add
Now = deps.now
Later = deps.later
function Remap(args)
	local lhs = args[1]
	local rhs = string.gsub(args[2], "^:(.-)$", "<cmd>%1<cr>")
	local mode = args.mode or "n"
	rest = {}
	for key, value in pairs(args) do
		if type(key) ~= "number" and key ~= "mode" then
			rest[key] = value
		end
	end
	if not (lhs and rhs) then
		vim.notify("Invalid keymap", vim.log.levels.ERROR)
		return
	end
	vim.keymap.set(mode, lhs, rhs, rest)
end

require("opts")
require("plugins")
