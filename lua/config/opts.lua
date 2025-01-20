vim.opt.relativenumber = true
vim.opt.scrolloff = 3
vim.opt.mouse = ""
vim.keymap.set("n", "<leader>cr", function()
	vim.lsp.buf.rename()
end, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabNext<cr>", { desc = "next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabprev<cr>", { desc = "previous tab" })
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "new tab" })
vim.keymap.set("n", "<leader>tq", "<cmd>tabclose<cr>", { desc = "close tab" })
