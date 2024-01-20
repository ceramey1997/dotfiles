local icons = require("cocodust.config.icons")

return {
  "airblade/vim-gitgutter",
  lazy = false,
  init = function()
    vim.g.gitgutter_sign_added = icons.Git.Added.Icon.Box_Plus
    vim.g.gitgutter_sign_modified = icons.Git.Modified.Icon.Pencil
    vim.g.gitgutter_sign_removed = icons.Git.Deleted.Icon.Minus
  end,
}
