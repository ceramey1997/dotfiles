-- No longer needed after version 1.39.11
local function fix_tokens(client)
  local function to_snake_case(str)
    return string.gsub(str, "%s*[- ]%s*", "_")
  end

  local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
  for i, v in ipairs(tokenModifiers) do
    tokenModifiers[i] = to_snake_case(v)
  end

  local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
  for i, v in ipairs(tokenTypes) do
    tokenTypes[i] = to_snake_case(v)
  end
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "c_sharp" })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "netcoredbg" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "Hoffs/omnisharp-extended-lsp.nvim" },
    opts = {
      servers = {
        lua_ls = {}
      },
      -- No longer needed after version 1.39.11
      --setup = {
      --  omnisharp = function(_, opts)
      --    local lsp_utils = require("cocodust.base.lsp.utils")
      --    opts.handlers = {
      --      ["textDocument/definition"] = require("omnisharp_extended").handler,
      --    }
      --    lsp_utils.on_attach(function(client, _)
      --      if client.name == "omnisharp" then
      --        fix_tokens(client)
      --      end
      --    end)
      --  end,
      --}
    }
  },
  {
    "rcarriga/nvim-dap-ui",
    ft = function(_, ft)
      vim.list_extend(ft, { "cs" })
    end
  },
  {
    "mfussenegger/nvim-dap",
    ft = function(_, ft)
      vim.list_extend(ft, { "cs" })
    end,
    opts = {
      setup = {
        netcorebdg = function(_, _)
          local dap = require("dap")

          local function get_debugger()
            local mason_registry = require("mason-registry")
            local debugger = mason_registry.get_package("netcoredbg")
            return debugger:get_install_path() .. "/netcoredbg"
          end

          dap.configurations.cs = {
            {
              type = "coreclr",
              request = "launch",
              name = "Launch - netcoredbg",

              program = function()
                return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
              end,
            }
          }

          dap.adapters.coreclr = {
            type = "executable",
            command = get_debugger(),
            --command = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/netcoredbg/netcoredbg",
            args = { "--interpreter=vscode" },
          }
        end
      }
    }
  }
}
