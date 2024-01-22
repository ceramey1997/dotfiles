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
    dependencies = { "typescript-tools.nvim" },
    opts = {
      servers = {
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
      vim.list_extend(opts.sources, nls.builtins.formatting.prettierd)
    end
  },
  {
    "pmizio/typescript-tools.nvim",
    opts = {},
    config = function(_, opts)
      require("cocodust.base.lsp_helpers.utils").on_attach(function(client, bufnr)
        if client.name == "tsserver" then
          vim.keymap.set(
            "n",
            "<leader>oi",
            "<cmd>TSToolsOrganizeImports<cr>",
            { buffer = bufnr, desc = "[O]rganize [I]mports" }
          )
          vim.keymap.set(
            "n",
            "<leader>si",
            "<cmd>TSToolsSortImports<cr>",
            { buffer = bufnr, desc = "[S]ort [I]mports" }
          )
          vim.keymap.set(
            "n",
            "<leader>ru",
            "<cmd>TSToolsRemoveUnused<cr>",
            { buffer = bufnr, desc = "[R]emove [U]nused" }
          )
          vim.keymap.set(
            "n",
            "<leader>lz",
            "<cmd>TSToolsGoToSourceDefinition<cr>",
            { buffer = bufnr, desc = "Go To Source Definition" }
          )
          vim.keymap.set(
            "n",
            "<leader>ri",
            "<cmd>TSToolsRemoveUnusedImports<cr>",
            { buffer = bufnr, desc = "[R]emove Unused [I]mports" }
          )
          vim.keymap.set(
            "n",
            "<leader>am",
            "<cmd>TSToolsAddMissingImports<cr>",
            { buffer = bufnr, desc = "[A]dd [M]issing Imports" }
          )
        end
      end)
      require("typescript-tools").setup(opts)
    end,
  },
}
