vim.opt.relativenumber = true
vim.opt.scrolloff = 3
vim.opt.mouse = ""
vim.keymap.set("n", "<leader>cr", function()
	vim.lsp.buf.rename()
end, { desc = "Rename symbol" })
