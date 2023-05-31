return {
	{
		"marko-cerovac/material.nvim",
		lazy = false,
		priority = 1000,
		opts = { theme = "auto" },
		config = function()
			vim.cmd([[colorscheme material]])
		end,
		-- config = function()
		-- 	vim.opt.background = "dark"
		-- 	vim.cmd([[colorscheme material]])
		-- end,
	},
	-- {
	-- 	"morhetz/gruvbox",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.opt.background = "dark"
	-- 		vim.cmd([[colorscheme gruvbox]])
	-- 	end,
	-- },
}
