return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "javascript", "typescript", "tsx" })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed,
        {
          "typescript-language-server",
          "eslint_d",
          "prettierd"
        }
      )
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- tsserver is deprecated, use ts_ls instead
        ts_ls = {
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = "node_modules/@vue/typescript-plugin",
                language = { "javascript", "typescript", "vue" },
              },
            },
          },
          filetypes = { "javascript", "typescript", "vue" },
        },
        -- ESLint
        eslint = {
          settings = {
            workingDirectory = { mode = "auto" },
          }
        }
      }
    }
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      -- Safely load prettierd in case it's not available
      local status_prettierd, prettierd = pcall(function() return nls.builtins.formatting.prettierd end)
      if status_prettierd then
        table.insert(opts.sources, prettierd)
      end
    end
  },
}
