return {
  {
  	"nvim-telescope/telescope.nvim",
  	cmd = "Telescope",
  	branch = "0.1.x",
  	keys = {
  		{
  			"<leader>ff",
  			function()
  				require("telescope.builtin").find_files()
  			end,
  			desc = "[F]ind [F]iles",
  		},
  		{
  			"<leader>fb",
  			function()
  				require("telescope.builtin").buffers()
  			end,
  			desc = "[F]ind [B]uffers",
  		},
  		{
  			"<leader>sa",
  			function()
  				require("telescope.builtin").autocommands()
  			end,
  			desc = "[S]earch [A]utocommands",
  		},
  		{
  			"<leader>sg",
  			function()
  				require("telescope.builtin").live_grep()
  			end,
  			desc = "[S]earch with [G]rep",
  		},
  		{
  			"<leader>sh",
  			function()
  				require("telescope.builtin").help_tags()
  			end,
  			desc = "[S]earch [H]elp",
  		},
  		{
  			"<leader>sk",
  			function()
  				require("telescope.builtin").keymaps()
  			end,
  			desc = "[S]earch [K]eymaps",
  		},
  	},
  	opts = {
  		defaults = {
  			initial_mode = "normal",
  		},
  	},
  },
}
