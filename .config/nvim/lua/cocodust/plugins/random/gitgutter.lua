local icons = require("cocodust.config.icons")

return {
  enabled = true,
  "airblade/vim-gitgutter",
  lazy = false,
  init = function()
    vim.g.gitgutter_sign_priority = 0
    --vim.g.gitgutter_set_sign_backgrounds = 1
    vim.g.gitgutter_sign_added = icons.Git.Added.Icon.Box_Plus
    vim.g.gitgutter_sign_modified = icons.Git.Modified.Icon.Pencil
    vim.g.gitgutter_sign_removed = icons.Git.Deleted.Icon.Minus
    --highlight GitGutterAdd    guifg=#009900 ctermfg=2
    --highlight GitGutterChange guifg=#bbbb00 ctermfg=3
    --highlight GitGutterDelete guifg=#ff2222 ctermfg=1
    --vim.g.gitgutter_sign_added = "|"
    --vim.g.gitgutter_sign_modified = "|"
    --vim.g.gitgutter_sign_removed = "|"
  end,
}
