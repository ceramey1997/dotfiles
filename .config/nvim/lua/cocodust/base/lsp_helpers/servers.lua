local M = {}

local lsp_utils = require("cocodust.base.lsp_helpers.utils")

local function lsp_init()
  local config = {
    diagnostic = {
      virtual_text = false,
      underline = false,
      severity_sort = true,
    },
  }

  local icons = require("cocodust.config.icons")
  --local diagnostic_signs = {
  --  { name = "DiagnosticSignError", text = icons.Diagnostics.Error.Icon.Line_Error },
  --  { name = "DiagnosticSignWarn",  text = icons.Diagnostics.Warning.Icon.Solid },
  --  { name = "DiagnosticSignInfo",  text = icons.Diagnostics.Info.Icon.Solid },
  --  { name = "DiagnosticSignHint",  text = icons.Diagnostics.Hint.Icon },
  --}

  --for _, sign in ipairs(diagnostic_signs) do
  --  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  --end

  vim.diagnostic.config(config.diagnostic)
end

function M.setup(_, opts)
  lsp_init()
  lsp_utils.on_attach(function(client, bufnr)
    require("cocodust.base.lsp_helpers.format").on_attach(client, bufnr)
    require("cocodust.base.lsp_helpers.keymaps").on_attach(client, bufnr)
  end)

  local servers = opts.servers
  local capabilities = lsp_utils.capabilities()

  local function setup(server)
    local server_opts = vim.tbl_deep_extend("force", {
      capabilities = capabilities,
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
    -- Use the new vim.lsp.config API instead of deprecated lspconfig
    local lspconfig = require("lspconfig")
    if lspconfig[server] then
      lspconfig[server].setup(server_opts)
    end
  end

  -- Setup mason-lspconfig if available
  local have_mason, mlsp = pcall(require, "mason-lspconfig")

  local ensure_installed = {} --@type string[]
  for server, server_opts in pairs(servers) do
    if server_opts then
      server_opts = server_opts == true and {} or server_opts
      -- run manual setup if mason=false
      if server_opts.mason == false then
        setup(server)
      else
        -- Let mason-lspconfig handle this server
        if server_opts.version then
          ensure_installed[#ensure_installed + 1] = server .. "@" .. server_opts.version
        else
          ensure_installed[#ensure_installed + 1] = server
        end
      end
    end
  end

  if have_mason then
    mlsp.setup({
      ensure_installed = ensure_installed,
      automatic_installation = true,
      handlers = {
        -- Default handler for all servers
        function(server_name)
          setup(server_name)
        end,
      },
    })
  end
end

return M
