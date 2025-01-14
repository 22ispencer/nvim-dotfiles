-- Setup configuration
Now(function()
	require("mini.extra").setup({})
end)
Now(function()
	require("mini.misc").setup({})
end)
require("plugins.mini.editing")
-- Disable UI plugins in vscode
if not vim.g.vscode then
	require("plugins.mini.ui")
end
