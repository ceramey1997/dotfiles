local function on_attach(client, bufnr)
	require("cocodust.plugins.lsp.keymaps").on_attach(client, bufnr)
	require("cocodust.plugins.lsp.formatting").on_attach(client, bufnr)

	if client.server_capabilities.documentSymbolProvider then
		require("nvim-navic").attach(client, bufnr)
	end
end

-- needed to fix omnisharp for whatever reason
local function fix_tokens(client)
	local function to_snake_case(str)
		return string.gsub(str, "%s*[- ]%s*", "_")
	end
	local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
	for i, v in ipairs(tokenModifiers) do
		tokenModifiers[i] = to_snake_case(v)
	end
	local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
	for i, v in ipairs(tokenTypes) do
		tokenTypes[i] = to_snake_case(v)
	end
end

return {
	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"cmp-nvim-lsp",
			"b0o/schemastore.nvim",
			"Hoffs/omnisharp-extended-lsp.nvim",
		},
		init = function()
			vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarning", { text = " ", texthl = "DiagnosticSignWarning" })
			vim.fn.sign_define("DiagnosticSignInformation", { text = " ", texthl = "DiagnosticSignInformation" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
			vim.diagnostic.config({
				virtual_text = {
					source = "always",
					prefix = "",
				},
				severity_sort = true,
				float = {
					source = "always",
				},
			})
		end,
		opts = {
			-- options for vim.diagnostic.config()
			diagnostics = {
				underline = true,
				virtual_text = false,
				severity_sort = true,
			},
			servers = {
				lua_ls = {},
				omnisharp = {},
				jsonls = {
					settings = {
						json = {
							validate = { enable = true },
						},
					},
				},
				tailwindcss = {
					filetypes_exclude = { "markdown" },
				},
			},
			-- you can do any additional lsp server setup here
			-- return true if you don't want this server to be setup with lspconfig
			setup = {
				tailwindcss = function(client, opts)
					local tw = require("lspconfig.server_configurations.tailwindcss")
					-- @param ft string
					opts.filetypes = vim.tbl_filter(function(ft)
						return not vim.tbl_contains(opts.filetypes_exlude or {}, ft)
					end, tw.default_config.filetypes)
				end,
				omnisharp = function(client, opts)
					local pid = vim.fn.getpid()
					local omnisharp_bin = vim.fn.stdpath("data") .. "/mason/packages/omnisharp/omnisharp"
					opts.handlers = {
						["textDocument/definition"] = require("omnisharp_extended").handler,
					}
					opts.cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) }
					opts.on_attach = function(client, bufnr)
						fix_tokens(client)
						on_attach(client, bufnr)
					end
				end,
				jsonls = function(client, opts)
					opts.settings.json.schemas = require("schemastore").json.schemas()
					opts.on_attach = function(client, bufnr)
						local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
						for i, v in ipairs(tokenModifiers) do
							tokenModifiers[i] = v:gsub(" ", "_")
						end
						local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
						for i, v in ipairs(tokenTypes) do
							tokenTypes[i] = v:gsub(" ", "_")
						end
						on_attach(client, bufnr)
					end
				end,
				lua_ls = function(client, opts)
					-- TODO: Only add this global if in neovim configs
					opts.settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					}
					opts.on_attach = on_attach
				end,
				["*"] = function(client, opts)
					opts.on_attach = on_attach
				end,
			},
		},
		config = function(plugin, opts)
			-- diagnostics
			vim.diagnostic.config(opts.diagnostics)

			local servers = opts.servers
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			local function setup(server)
				local server_opts = servers[server] or {}
				server_opts.capabilities = capabilities
				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup["*"] then
					if opts.setup["*"](server, server_opts) then
						return
					end
				end
				require("lspconfig")[server].setup(server_opts)
			end

			local mlsp = require("mason-lspconfig")
			local available = mlsp.get_available_servers()

			local ensure_installed = {}
			for server, server_opts in pairs(servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
					-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
					if server_opts.mason == false or not vim.tbl_contains(available, server) then
						setup(server)
					else
						ensure_installed[#ensure_installed + 1] = server
					end
				end
			end

			require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
			require("mason-lspconfig").setup_handlers({ setup })
		end,
	},
	{
		-- suppose to highlight colors on the color entry. not working with vue
		"NvChad/nvim-colorizer.lua",
		lazy = false,
		config = function()
			require("colorizer").setup({
				user_default_optiions = {
					tailwind = true,
				},
				filetypes = {
					"css",
					"vue",
				},
			})
		end,
	},
	{
		-- tailwind color swatches
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
		},
		-- opts = function(_, opts)
		-- 	local format_kinds = opts.formatting.format
		-- 	opts.formatting.format = function(entry, item)
		-- 		format_kinds(entry, item) -- add icon
		-- 		return require("tailwindcss-colorizer-cmp").formatter(entry, item)
		-- 	end
		-- end,
		-- replace below with commented out when figured out icons?
		opts = function(_, opts)
			opts.formatting = {
				format = require("tailwindcss-colorizer-cmp").formatter,
			}
		end,
	},

	-- formatters
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					nls.builtins.formatting.fish_indent,
					nls.builtins.diagnostics.fish,
					nls.builtins.formatting.stylua,
					nls.builtins.formatting.shfmt,
					nls.builtins.formatting.prettierd,
					nls.builtins.formatting.shellharden,
					nls.builtins.diagnostics.codespell,
					nls.builtins.diagnostics.gitlint,
					nls.builtins.diagnostics.jsonlint,
					nls.builtins.diagnostics.yamllint,
				},
			}
		end,
	},

	-- cmdline tools and lsp servers
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ensure_installed = {
				"prettierd",
				"shellharden",
				"stylua",
				"codespell",
				"gitlint",
				"jsonlint",
				"yamllint",
				"css-lsp",
				"dockerfile-language-server",
				"typescript-language-server",
				"vue-language-server",
				"eslint-lsp",
			},
		},
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "[C]heck [M]ason" } },
		config = function(plugin, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
}
