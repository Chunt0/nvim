return {
	{ -- buftabline
		"jose-elias-alvarez/buftabline.nvim",
		requires = { "kyazdani42/nvim-web-devicons" }, -- optional!
		config = function()
			require("buftabline").setup({})
		end,
		options = {
			tab_format = "#{i} #{n}: #{b}#{f} ",
			buffer_id_index = false,
			icon_colors = true,
			start_hidden = false,
			auto_hide = false,
			disable_commands = false,
			go_to_maps = true,
			flags = {
				modified = " [+]",
				not_modifiable = " [-]",
				readonly = " [RO]",
			},
			hlgroups = {
				current = "TabLineSel",
				normal = "TabLine",
				active = nil,
				spacing = nil,
				modified_current = nil,
				modified_normal = nil,
				modified_active = nil,
				tabpage_current = nil,
				tabpage_normal = nil,
			},
			show_tabpages = true,
			tabpage_format = " #{n} ",
			tabpage_position = "right",
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
