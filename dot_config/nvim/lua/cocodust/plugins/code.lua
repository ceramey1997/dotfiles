return {
	-- snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
	},

	-- auto completion
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
		},
		opts = function()
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			local cmp_mappings = {
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp_mappings,
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			}
		end,
	},
	{
		"Darazaki/indent-o-matic",
		lazy = false,
		opts = {
			-- Number of lines without indentation before giving up (use -1 for infinite)
			max_lines = 2048,
			-- Space indentations that should be detected
			standard_widths = { 2, 4, 8 },
			-- Skip multi-line comments and strings (more accurate detection but less performant)
			skip_multiline = true,

			-- Only detect 4 spaces and tabs for csharp files
			filetype_csharp = {
				standard_widths = { 4 },
			},
			-- Only detect 2 spaces and tabs for Typescript / rust files
			filetype_typescript = {
				standard_widths = { 2 },
			},
			filetype_vue = {
				standard_widths = { 2 },
			},

			-- Don't detect 8 spaces indentations inside files without a filetype
			filetype_ = {
				standard_widths = { 2, 4 },
			},
		},
	},
}
