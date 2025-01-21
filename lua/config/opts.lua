vim.opt.relativenumber = true
vim.opt.scrolloff = 3
vim.opt.mouse = ""
vim.keymap.set("n", "<leader>cr", function()
	vim.lsp.buf.rename()
end, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "new tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "new tab" })
vim.keymap.set("n", "<leader>tq", "<cmd>tabclose<cr>", { desc = "close tab" })
vim.keymap.set("n", "<leader>tc", "<cmd>tcd ", { desc = "change directory of tab root" })

vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
	callback = function(event)
		if vim.bo[event.buf].filetype == "help" then
			if vim.b[event.buf].help_resized then
				return
			end
			vim.b[event.buf].minianimate_disable = true
			local width = vim.opt.columns:get()
			if width > 81 * 2 then
				vim.cmd("wincmd L")
				vim.cmd("wincmd 81 |")
			else
				vim.cmd("wincmd T")
			end
			vim.b[event.buf].help_resized = true
		end
	end,
})
