local icons = require("cocodust.config.icons")

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  version = "*",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  keys = function()
    local bline = require("bufferline")
    local mappings = {}

    for var = 1, 9, 1 do
      table.insert(mappings, {
        string.format("<leader>%s", var),
        function()
          bline.go_to_buffer(var, true)
        end,
        desc = string.format("Goto Buffer %s", var)
      })
    end
    return mappings
  end,
  opts = function()
    return {
      options = {
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" }
        },
        color_icons = true,
        separator_style = "slope",
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local ret = (diag.error and icons.Diagnostics.Error.Icon.File_Error .. " " .. diag.error .. " " or "")
              .. (diag.warning and icons.Diagnostics.Warning.Icon.Solid .. " " .. diag.warning or "")
          return vim.trim(ret)
        end,
        numbers = function(opts)
          local state = require("bufferline.state")
          for i, buf in ipairs(state.components) do
            if buf.id == opts.id then
              return i
            end
          end
          return opts.ordinal
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-Tree",
            highlight = "Directory",
            text_align = "left"
          },
        },
      }
    }
  end
}
