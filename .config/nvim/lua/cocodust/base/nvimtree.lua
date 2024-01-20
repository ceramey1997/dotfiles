local icons = require("cocodust.config.icons")

return {
	{ "nvim-lua/plenary.nvim" },

{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"plenary.nvim",
			"nvim-web-devicons",
			"nui.nvim",
		},
		cmd = "Neotree",
		keys = {
			{ "<leader>b", "<cmd>Neotree toggle<cr>", desc = "Open File Tree" },
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

      -- Open on initial startup
			if vim.fn.argc() == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					vim.cmd.cd(vim.fn.argv(0))
					require("neo-tree")
				end
			end
    end,
		opts = {
			close_if_last_window = true,
			filesystem = {
        bind_to_cwd = {
          enabled = false
        },
				follow_current_file = {
					enabled = true,
				},
        default_component_config = {
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
            }
          }
        }
			},
		},
	},
}

