local icons = require("cocodust.config.icons")

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
  	local function fg(name)
  		return function()
  			local hl = vim.api.nvim_get_hl_by_name(name, true)
  			return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
  		end
  	end

  	return {
  		options = {
  			theme = "powerline_dark",
  			globalstatus = true,
  			disabled_filetypes = { statusline = { "lazy", "alpha" } },
  		},
  		sections = {
  			lualine_a = { "mode" },
  			lualine_b = { "branch" },
  			lualine_c = {
  				{
  					"diagnostics",
  					symbols = {
  						error = icons.Diagnostics.Error.Icon.Line_Error,
  						warn = icons.Diagnostics.Warning.Icon.Outline,
  						info = icons.Diagnostics.Info.Icon.Outline,
  						hint = icons.Diagnostics.Hint.Icon,
  					},
  				},
  				{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
  				{
  					"filename",
  					path = 1,
  					symbols = { modified = icons.Git.Modified.Icon.Document, readonly = "", unnamed = "" },
  				},
  				{
  					function()
  						return require("nvim-navic").get_location()
  					end,
  					cond = function()
  						return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
  					end,
  				},
  			},
  			lualine_x = {
  				{
  					require("lazy.status").updates,
  					cond = require("lazy.status").has_updates,
  					color = fg("Special"),
  				},
  				{
  					"diff",
  					symbols = {
  						added = icons.Git.Added.Icon.Box_Plus,
  						modified = icons.Git.Modified.Icon.Box_Diagonal_Solid,
  						removed = icons.Git.Deleted.Icon.Box_Minus_Solid,
  					},
  				},
  			},
  			lualine_y = {
  				{ "progress", separator = "", padding = { left = 1, right = 0 } },
  				{ "location", padding = { left = 0, right = 1 } },
  			},
  			lualine_z = {
  				function()
  					return icons.Diagnostics.Waiting.Icon .. os.date("%R")
  				end,
  			},
  		},
  		extensions = { "neo-tree" },
  	}
  end,
}
