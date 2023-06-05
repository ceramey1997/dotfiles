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
					local ret = (diag.error and " " .. diag.error .. " " or "")
						.. (diag.warning and " " .. diag.warning or "")
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
								error = "",
								warn = "",
								info = "",
								hint = "",
							},
						},
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
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
								added = " ",
								modified = " ",
								removed = " ",
							},
						},
					},
					lualine_y = {
						{ "progress", separator = "", padding = { left = 1, right = 0 } },
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {
						function()
							return " " .. os.date("%R")
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
						icon = "",
						color = "#c595c8",
						cterm_color = "134",
						name = "prettierrc",
					},
					["Tiltfile"] = {
						icon = "",
						color = "#00af5f",
						cterm_color = "35",
						name = "Tiltfile",
					},
					["Dockerfile"] = { -- doesn't work
						icon = "",
						color = "#afffff",
						cterm_color = "159",
					},
				},
				override_by_extension = {
					["local"] = {
						icon = "",
						color = "#de8d14",
						cterm_color = "172",
						name = "local_files",
					},
					["cs"] = {
						icon = "",
						color = "#007aff",
						cterm_color = "20",
						name = "csharp",
					},
					["csproj"] = {
						icon = "",
						color = "#890fb0",
						cterm_color = "5",
						name = "csproj",
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
