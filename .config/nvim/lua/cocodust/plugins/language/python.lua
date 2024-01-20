return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.diagnostics.mypy)
      table.insert(opts.sources, nls.builtins.diagnostics.ruff)
      table.insert(opts.sources, nls.builtins.formatting.black)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "python" })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "pyright", "mypy", "ruff", "black", "debugpy" })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    ft = function(_, ft)
      vim.list_extend(ft, { "python" })
    end
  },
  {
    "mfussenegger/nvim-dap",
    ft = function(_, ft)
      vim.list_extend(ft, { "python" })
    end,
    opts = {
      setup = {
        python = function(_, _)
          local dap = require("dap")

          local function get_debugger()
            local mason_registry = require("mason-registry")
            local debugger = mason_registry.get_package("debugpy")
            return debugger:get_install_path() .. "/venv/bin/python3"
          end

          dap.configurations.python = {
            {
              type = "python",
              request = "launch",
              name = "Launch file",

              program = "${file}",
              pythonPath = function()
                return "/usr/bin/python3"
              end
            }
          }
          dap.adapters.python = {
            type = "executable",
            command = get_debugger(),
            --command = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python3",
            args = { "-m", "debugpy.adapter" },
          }
        end
      }
    }
  }
}
