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
    optional = true,
    opts = function(_, opts)
      if not opts.sources then
        opts.sources = {}
      end

      local has_null_ls, nls = pcall(require, "null-ls")
      if not has_null_ls then
        return
      end

      -- Safely try to load each builtin
      if nls.builtins.diagnostics.mypy then
        table.insert(opts.sources, nls.builtins.diagnostics.mypy)
      end

      if nls.builtins.formatting.black then
        table.insert(opts.sources, nls.builtins.formatting.black)
      end

      -- Note: ruff support in none-ls may vary by version
      -- Skipping ruff to avoid errors - use ruff LSP server instead via Mason
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
