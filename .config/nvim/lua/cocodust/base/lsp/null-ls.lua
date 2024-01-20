return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  dependencies = { "mason.nvim" },
  setup = {
    debug = true
  },
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        nls.builtins.diagnostics.gitlint,
      },
    }
  end,
}
