return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "none-ls.nvim"
  },
  opts = {
    servers = {},
    setup = {},
    priority = 1
  },
  config = function(plugin, opts)
    require("cocodust.base.lsp_helpers.servers").setup(plugin, opts)
  end
}