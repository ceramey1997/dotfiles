return {
  "NvChad/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      user_default_options = {
        tailwind = true
      },
      filetypes = {
        "css",
        "vue",
      },
    })
  end,
}
