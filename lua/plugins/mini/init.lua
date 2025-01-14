-- Setup configuration
require("plugins.mini.helpers")
require("plugins.mini.editing")
-- Disable UI plugins in vscode
if not vim.g.vscode then
	require("plugins.mini.ui")
end
