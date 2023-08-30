local icons = require("cocodust.icons")

local M = {}

function M.setup()
	local lsp = {
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
		},
		diagnostic = {
			virtual_text = false, --{ spacing = 4, prefix = "●" },
			underline = true,
			update_in_insert = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
			},
		},
	}

	-- Diagnostics signs
	local diagnostic_signs = {
		{ name = "DiagnosticSignError", text = icons.Diagnostics.Error.Icon.Line_Error },
		{ name = "DiagnosticSignWarn", text = icons.Diagnostics.Warning.Icon.Solid },
		{ name = "DiagnosticSignInfo", text = icons.Diagnostics.Info.Icon.Solid },
		{ name = "DiagnosticSignHint", text = icons.Diagnostics.Hint.Icon },
	}

	for _, sign in ipairs(diagnostic_signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
	end

	-- config for floating text and handlers - wait till later
	-- Diagnostics Configuration
	vim.diagnostic.config(lsp.diagnostic)

	-- -- Hover Configuration
	-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsp.float)

	-- -- -- Signature Help Configuration
	-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, lsp.float)
end

return M
