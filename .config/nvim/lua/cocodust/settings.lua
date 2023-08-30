vim.opt.nu = true
vim.opt.relativenumber = true
-- vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.undofile = true
vim.opt.updatetime = 50

vim.opt.colorcolumn = "150"

vim.opt.listchars = "eol:↴,space:⋅,tab:>-,nbsp:+"

vim.g.mapleader = " "

vim.opt.cursorline = true

-- for dev-icons
vim.opt.encoding = "UTF-8"

-- Change viminfo home to conform with XDG standards
local xdg_state = os.getenv("XDG_STATE_HOME")
vim.opt.viminfofile = string.format("%s/vim/viminfo", xdg_state)
