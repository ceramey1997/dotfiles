--local function on_attach(client, bufnr)
--  require("cocodudst.base.lsp.keymaps").on_attach(client, bufnf)
--
--  if client.server_capabilites.documentSymbolProvider then
--    require("nvim-navic").attach(client, bufnr)
--  end
--end
--
--local lua = require("cocodust.base.lsp.lua")

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jose-elias-alvarez/null-ls.nvim"
  },
  opts = {
    servers = {},
    setup = {},
  },
  config = function(plugin, opts)
    require("cocodust.base.lsp.servers").setup(plugin, opts)
  end
}
