local M = {}

local lsp_utils = require("cocodust.base.lsp.utils")

local function lsp_init()
  local config = {
    diagnostic = {
      virtual_text = false,
      underline = false,
      serverity_sort = false,
    },
  }

  local icons = require("cocodust.config.icons")
  local diagnostic_signs = {
    { name = "DiagnosticSignError", text = icons.Diagnostics.Error.Icon.Line_Error },
    { name = "DiagnosticSignWarn",  text = icons.Diagnostics.Warning.Icon.Solid },
    { name = "DiagnosticSignInfo",  text = icons.Diagnostics.Info.Icon.Solid },
    { name = "DiagnosticSignHint",  text = icons.Diagnostics.Hint.Icon },
  }

  for _, sign in ipairs(diagnostic_signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  vim.diagnostic.config(config.diagnostic)
end

function M.setup(_, opts)
  lsp_init()
  lsp_utils.on_attach(function(client, bufnr)
    require("cocodust.base.lsp.format").on_attach(client, bufnr)
    require("cocodust.base.lsp.keymaps").on_attach(client, bufnr)
  end)

  local servers = opts.servers
  local capabilites = lsp_utils.capabilites()

  local function setup(server)
    local server_opts = vim.tbl_deep_extend("force", {
      capabilites = capabilites,
    }, servers[server] or {})

    if opts.setup[server] then
      if opts.setup[server](server, server_opts) then
        return
      end
    elseif opts.setup["*"] then
      if opts.setup["*"](server, server_opts) then
        return
      end
    end
    require("lspconfig")[server].setup(server_opts)
  end

  -- get all servers that are available through mason-lspconfig
  local have_mason, mlsp = pcall(require, "mason-lspconfig")
  local all_mlsp_servers = {}
  if have_mason then
    all_mlsp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
  end

  local ensure_installed = {} --@type string[]
  for server, server_opts in pairs(servers) do
    if server_opts then
      server_opts = server_opts == true and {} or server_opts
      -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
      if server_opts.mason == false or not vim.tbl_contains(all_mlsp_servers, server) then
        setup(server)
      else
        if server_opts.version then
          ensure_installed[#ensure_installed + 1] = server .. "@" .. server_opts.version
        else
          ensure_installed[#ensure_installed + 1] = server
        end
      end
    end
  end

  if have_mason then
    mlsp.setup({ ensure_installed = ensure_installed })
    mlsp.setup_handlers({ setup })
  end
end

return M
