Add("williamboman/mason.nvim")
Later(function() 
	require("mason").setup{}
	Remap({ "<leader>cm", ":Mason" })
end)
