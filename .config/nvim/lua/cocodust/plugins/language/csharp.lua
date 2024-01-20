-- No longer needed after version 1.39.11
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
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "c_sharp" })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "netcoredbg" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "Hoffs/omnisharp-extended-lsp.nvim" },
    opts = {
      servers = {
        lua_ls = {}
      },
      -- No longer needed after version 1.39.11
      --setup = {
      --  omnisharp = function(_, opts)
      --    local lsp_utils = require("cocodust.base.lsp.utils")
      --    opts.handlers = {
      --      ["textDocument/definition"] = require("omnisharp_extended").handler,
      --    }
      --    lsp_utils.on_attach(function(client, _)
      --      if client.name == "omnisharp" then
      --        fix_tokens(client)
      --      end
      --    end)
      --  end,
      --}
    }
  }
}
