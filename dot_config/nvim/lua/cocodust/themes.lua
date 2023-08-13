local M = {}

M.setupMaterial = function()
	return {
		{
			"marko-cerovac/material.nvim",
			lazy = false,
			priority = 1000,
			opts = { theme = "auto" },
			config = function()
				vim.cmd([[colorscheme material]])
			end,
		},
	}
end

M.setupGruvBox = function()
	return {
		{
			"morhetz/gruvbox",
			lazy = false,
			priority = 1000,
			config = function()
				vim.opt.background = "dark"
				vim.cmd([[colorscheme gruvbox]])
			end,
		},
	}
end

M.setupKangawa = function()
	return {
		{
			"rebelot/kanagawa.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				vim.opt.background = "light"
				vim.cmd([[colorscheme kanagawa]])
			end,
		},
	}
end

M.setupMelange = function()
	return {
		{
			"savq/melange-nvim",
			lazy = false,
			priority = 1000,
			config = function()
				vim.opt.background = "dark"
				vim.cmd([[colorscheme melange]])
			end,
		},
	}
end

return M
