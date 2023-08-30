local icons = require("cocodust.icons")
return {
	-- better `vim.notify()`
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
	},

	-- better vim.ui
	{
		"stevearc/dressing.nvim",
		init = function()
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	-- bufferline
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				diagnostics_indicator = function(_, _, diag)
					local ret = (diag.error and icons.Diagnostics.Error.Icon.Line_Error .. diag.error .. " " or "")
						.. (diag.warning and icons.Diagnostics.Warning.Icon.Solid .. diag.warning or "")
					return vim.trim(ret)
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function(plugin)
			local function fg(name)
				return function()
					local hl = vim.api.nvim_get_hl_by_name(name, true)
					return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
				end
			end

			return {
				options = {
					theme = "auto",
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
	},

	-- noicer ui
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	dependencies = { "nvim-treesitter" },
	-- 	opts = {
	-- 		lsp = {
	-- 			override = {
	-- 				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	-- 				["vim.lsp.util.stylize_markdown"] = true,
	-- 			},
	-- 		},
	-- 		presets = {
	-- 			bottom_search = true,
	-- 			command_palette = true,
	-- 			long_message_to_split = true,
	-- 		},
	-- 	},
	-- },

	{
		"SmiteshP/nvim-navic",
		init = function()
			vim.g.navic_silence = true
		end,
		opts = { separator = " ", highlight = true, depth_limit = 5 },
	},

	-- icons
	-- Uncomment once (https://github.com/zellij-org/zellij/issues/1538) is resolved
	{
		"kyazdani42/nvim-web-devicons",
		lazy = false,
		config = function()
			require("nvim-web-devicons").setup({
				default = true,
				strict = true,
				-- override = {},
				override_by_filename = {
					[".prettierrc.json"] = {
						icon = icons.Files.Prettier.Icon,
						color = icons.Files.Prettier.HexColor,
						cterm_color = icons.Files.Prettier.CtermColor,
						name = "prettierrc",
					},
					["tiltfile"] = {
						icon = icons.Files.TiltFile.Icon,
						color = icons.Files.TiltFile.HexColor,
						cterm_color = icons.Files.TiltFile.CtermColor,
						name = "Tiltfile",
					},
					["dockerfile"] = { -- doesn't work
						icon = icons.Files.DockerFile.Icon,
						color = icons.Files.DockerFile.HexColor,
						cterm_color = icons.Files.DockerFile.CtermColor,
						name = "dockerfile",
					},
				},
				override_by_extension = {
					["local"] = {
						icon = icons.Files.Local.Icon,
						color = icons.Files.Local.HexColor,
						cterm_color = icons.Files.Local.CtermColor,
						name = "local_files",
					},
					["cs"] = {
						icon = icons.Files.Csharp.Icon,
						color = icons.Files.Csharp.HexColor,
						cterm_color = icons.Files.Csharp.CtermColor,
						name = "csharp",
					},
					["csproj"] = {
						icon = icons.Files.Csproj.Icon,
						color = icons.Files.Csproj.HexColor,
						cterm_color = icons.Files.Csproj.CtermColor,
						name = "csproj",
					},
					["ps1"] = {
						icon = icons.Files.Powershell.Icon,
						color = icons.Files.Powershell.HexColor,
						cterm_color = icons.Files.Powershell.CtermColor,
						name = "psScriptFile",
					},
					["bicep"] = {
						icon = icons.Files.Bicep.Icon,
						color = icons.Files.Bicep.HexColor,
						cterm_color = icons.Files.Bicep.CtermColor,
						name = "bicep",
					},
				},
			})
		end,
	},
	-- filetype glyphs  -- good other 
	{ "ryanoasis/vim-devicons", lazy = false },
	-- { "nvim-tree/nvim-web-devicons" },

	-- ui components
	{ "MunifTanjim/nui.nvim" },
}
