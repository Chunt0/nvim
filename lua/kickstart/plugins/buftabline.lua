return {
	{ -- buftabline
		"jose-elias-alvarez/buftabline.nvim",
		requires = { "kyazdani42/nvim-web-devicons" }, -- optional!
		config = function()
			require("buftabline").setup({})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
