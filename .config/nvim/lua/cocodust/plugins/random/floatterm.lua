return {
  "voldikss/vim-floaterm",
  cmd = "FloatermNew",
  config = function()
    vim.g.floaterm_autoclose = 2
    vim.g.floaterm_heigh = 0.9
    vim.g.floaterm_width = 0.6
    vim.g.floaterm_position = "topright"
  end,
  keys = {
    {
      "<leader>lg",
      "<cmd>FloatermNew --name=git lazygit <CR>",
      desc = "Open [L]azy [G]it",
    },
  },
}
