-- map leaders
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.skip_ts_context_commentstring_module = true
--

-- text related config
vim.opt.number = true
vim.opt.relativenumber = true -- https://neovim.io/doc/user/options.html#'relativenumber'
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.scrolloff = 8      -- https://neovim.io/doc/user/options.html#'scrolloff'
vim.opt.signcolumn = "yes" -- https://neovim.io/doc/user/options.html#'signcolumn'
--

-- for dev-icons
vim.opt.encoding = "UTF-8"
--

-- backup / swap / undo
vim.opt.swapfile = false -- https://neovim.io/doc/user/options.html#'swapfile'
vim.opt.backup = false   -- https://neovim.io/doc/user/options.html#'backup'
vim.opt.undofile = true  -- https://neovim.io/doc/user/options.html#'undofile'
--

-- vim outsiders
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.colorcolumn = "100"
vim.opt.cursorline = true
--

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
--

-- Change viminfo home to conform with XDG standards
local xdg_state = os.getenv("XDG_STATE_HOME")
vim.opt.viminfofile = string.format("%s/vim/viminfo", xdg_state)

-- unknown
--vim.opt.list = true -- https://neovim.io/doc/user/options.html#'list'
vim.opt.completeopt = "menuone,noselect" -- https://neovim.io/doc/user/options.html#'completeopt'
vim.opt.listchars = "eol:↴,space:⋅,tab:>-,nbsp:+" -- https://neovim.io/doc/user/options.html#'listchars'
--

-- other
vim.opt.mousemoveevent = true
--
