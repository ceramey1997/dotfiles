return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn't work on Windows
		build = ":TSUpdate",
		event = "BufReadPost",
		keys = {
			{ "<C-space>", desc = "Increment selection" },
			{ "<bs>", desc = "Shrink selection", mode = "x" },
		},
		opts = {
			autotag = {
				enable = true,
			},
			matchup = {
				enable = true,
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			context_commentstring = { enable = true, enable_autocmd = false },
			ensure_installed = {
				"bash",
				"vimdoc",
				"lua",
				"markdown",
				"markdown_inline",
				"query",
				"regex",
				"vim",
				"yaml",
				"c_sharp",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = "<nop>",
					node_decremental = "<bs>",
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"nvim-treesitter/playground",
		cmd = { "TSPlaygroundToggle", "TSNodeUnderCursor" },
		config = function()
			require("nvim-treesitter-playground")
		end,
	},
	{
		"carlsmedstad/vim-bicep",
		ft = "bicep",
	},
}
