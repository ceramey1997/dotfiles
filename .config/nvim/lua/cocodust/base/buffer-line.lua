local icons = require("cocodust.config.icons")

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  version = "*",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      diagnostics_indicator = function(_, _, diag)
        local ret = (diag.error and icons.Diagnostics.Error.Icon.File_Error .. " " .. diag.error .. " " or "")
            .. (diag.warning and icons.Diagnostics.Warning.Icon.Solid .. " " .. diag.warning or "")
        return vim.trim(ret)
      end,
      numbers = "ordinal",
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
}
