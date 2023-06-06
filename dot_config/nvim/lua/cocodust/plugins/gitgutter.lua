return {
	{
		"airblade/vim-gitgutter",
		lazy = false,
		init = function()
			vim.g.gitgutter_sign_added = ""
			vim.g.gitgutter_sign_modified = ""
			vim.g.gitgutter_sign_removed = ""
		end,
	},
}
