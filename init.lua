-- Put this at the top of 'init.lua'
local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    -- Uncomment next line to use 'stable' branch
    -- '--branch', 'stable',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
end

require("mini.deps").setup{}

vim.g.mapleader = " "
Add = MiniDeps.add
Now = MiniDeps.now
Later = MiniDeps.later
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

-- Source all files in "lua/plugins" folder
local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"
local handle = vim.loop.fs_scandir(plugins_dir)

if not handle then
	print("Could not open plugins directory: " .. plugins_dir)
	return
end

while true do
	local name, t = vim.loop.fs_scandir_next(handle)
	if not name then
		break  -- No more entries
	end

	-- Check if the entry is a Lua file
	if t == "file" and name:match("%.lua$") then
		local plugin_name = name:sub(1, -5)  -- Remove the ".lua" extension
		require("plugins." .. plugin_name)  -- Require the plugin
	end
end

