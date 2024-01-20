return {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  dependencies = { "williamboman/mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    --opts.root_dir = opts.root_dir
    --    or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
    --opts.sources = vim.list_extend(opts.sources or {}, {
    --  nls.builtins.diagnostics.gitlint,
    --})
    return {
      sources = {
        nls.builtins.diagnostics.gitlint,
      },
    }
  end,
}
