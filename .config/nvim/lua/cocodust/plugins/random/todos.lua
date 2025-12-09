return {
	{
    "folke/todo-comments.nvim",
    dependencies = {
    	"plenary.nvim",
    },
    event = "BufReadPost",
    cmd = {
    	"TodoTelescope",
    	"TodoTrouble",
    	"TodoQuickFix",
    	"TodoLocList",
    },
    config = true,
    keys = {
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "[S]earch [T]odos" },
    }
	},
	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-web-devicons",
		},
		cmd = {
			"Trouble",
			"TroubleToggle",
		},
		config = true,
	},
}
