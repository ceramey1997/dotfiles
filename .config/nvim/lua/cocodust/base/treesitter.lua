return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-ts-context-commentstring",
    },
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    --ensure_installed = { "help", "javascript", "typescript", "lua", "vim", "vimdoc", "query" },
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)
    end,
    opts = {
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      ensure_installed = {
        "gitcommit",
        "git_rebase",
        "gitignore",
      },
    },
  },
  {
    "nvim-treesitter/playground",
    cmd = { "TSPlaygroundToggle", "TSNodeUnderCursor" },
    config = function()
      require("nvim-treesitter-playground")
    end,
  },
}
