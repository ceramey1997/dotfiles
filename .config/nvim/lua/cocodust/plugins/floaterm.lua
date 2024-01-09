return {
	{
		"voldikss/vim-floaterm",
		cmd = "FloatermNew", -- --name=git --height=0.6 --width=0.4 --position=topleft ",
		config = function()
			vim.g.floaterm_autoclose = 2
			vim.g.floaterm_height = 0.9
			vim.g.floaterm_width = 0.6
			vim.g.floaterm_position = "topright"
		end,
		keys = {
			{
				"<leader>lg",
				"<cmd>FloatermNew --name=git lazygit <CR>",
				desc = "Open Lazy Git",
			},
		},
	},
}
