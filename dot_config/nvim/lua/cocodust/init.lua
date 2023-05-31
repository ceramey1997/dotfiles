require("cocodust.settings")
require("cocodust.remap")
require("cocodust.filetypes")

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

-- Configure lazy.nvim
require("lazy").setup("cocodust.plugins", {
	defaults = {
		lazy = true,
	},
	install = {
		colorscheme = { "material" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
	performance = {
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
