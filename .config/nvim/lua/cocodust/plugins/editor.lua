local icons = require("cocodust.icons")
return {
	-- File Explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		version = "2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		cmd = "NeoTree",
		keys = {
			{
				"<leader>b",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
				end,
				desc = "Open File Tree",
			},
		},
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1

			vim.fn.sign_define(
				"LspDiagnosticsSignError",
				{ text = icons.Diagnostics.Error.Icon.Line_Error, texthl = "LspDiagnosticsSignError" }
			)
			vim.fn.sign_define(
				"LspDiagnosticsSignWarning",
				{ text = icons.Diagnostics.Warning.Icon.Solid, texthl = "LspDiagnosticsSignWarning" }
			)
			vim.fn.sign_define(
				"LspDiagnosticsSignInformation",
				{ text = icons.Diagnostics.Info.Icon.Solid, texthl = "LspDiagnosticsSignInformation" }
			)
			vim.fn.sign_define(
				"LspDiagnosticsSignHint",
				{ text = icons.Diagnostics.Hint.Icon, texthl = "LspDiagnosticsSignHint" }
			)

			if vim.fn.argc() == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					vim.cmd.cd(vim.fn.argv(0))
					require("neo-tree")
				end
			end
		end,
		opts = {
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = true,
			},
			default_component_configs = {
				diagnostics = {
					symbols = {
						hint = icons.Diagnostics.Hint.Icon,
						info = icons.Diagnostics.Info.Icon.Outline,
						warn = icons.Diagnostics.Warning.Icon.Outline,
						error = icons.Diagnostics.Error.Icon.File_Error,
					},
					highlights = {
						hint = "DiagnosticSignHint",
						info = "DiagnosticSignInfo",
						warn = "DiagnosticSignWarn",
						error = "DiagnosticSignError",
					},
				},
				git_status = {
					symbols = {
						added = icons.Git.Added.Icon.File_Plus,
						modified = icons.Git.Modified.Icon.Git_PR,
						deleted = icons.Git.Deleted.Icon.X,
						renamed = icons.Git.Renamed.Icon,
						-- Status type
						untracked = icons.Git.Untracked.Icon,
						ignored = icons.Git.Ignored.Icon,
						unstaged = "",
						staged = icons.Git.Staged.Icon,
						conflict = icons.Git.Conflict.Icon,
					},
				},
			},
			window = {
				mappings = {
					["<space>"] = "none",
				},
			},
		},
	},

	-- Fuzzy Finding
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

	-- Show Different kinds of comments differently
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = "BufReadPost",
		config = true,
		keys = {
			{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "[S]earch [T]odos" },
		},
	},
}
