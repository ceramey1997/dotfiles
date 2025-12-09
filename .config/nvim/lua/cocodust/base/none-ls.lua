return {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  dependencies = { "williamboman/mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        nls.builtins.diagnostics.gitlint,
      },
    }
  end,
}
