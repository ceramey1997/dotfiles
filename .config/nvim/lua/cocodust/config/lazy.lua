-- Install lazy.nvim if it doesn't exist
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
-- Load lazy.nvim into runtime path
vim.opt.runtimepath:prepend(lazypath)

local modules = require("cocodust.config.lazy-modules")
---- Configure lazy.nvim
require("lazy").setup({
  spec = modules.Specs,
  lockfile = vim.fn.stdpath("data") .. "/lazy/lazy-lock.json",
  defaults = {
    lazy = true,
    version = nil,
  },
  install = {
    missing = true,
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
