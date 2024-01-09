-- Vim Normal Morde Keybinds
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v" }, "<Leader>y", '"+y', { desc = "[Y]ank selection to system" })
vim.keymap.set("n", "<Leader>Y", '"+Y', { desc = "[Y]ank line to system" })
vim.keymap.set({ "n", "v" }, "<Leader>p", '"+p', { desc = "[P]aste after from system" })
vim.keymap.set("n", "<Leader>P", '"+P', { desc = "[P]aste befre from system" })
vim.keymap.set("n", "<Leader>ro", "<cmd>LspRestart omnisharp<cr>", { desc = "Lsp[R]estart [O]mnisharp" })

-- vim.keymap.set("@", "w", "CTRL-W", { desc = "Begin to move cusor context. replace <Ctrl>_W" })
vim.keymap.set("n", "<Leader>cl", "<cmd>Lazy show<cr>", { desc = "[C]heck [L]azy status menu" })
vim.keymap.set("n", "<F2>", "<cmd>echo 'Current time is ' . strftime('%c')<CR>", { desc = "[F2]Show Current time" })
vim.keymap.set("n", "<Leader>nh", "<cmd>noh<cr>", { desc = "[N]o [H]ighlight search" })

-- Vim Visual Mode Keybinds
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection Up" })

-- Vim All Modes Keybinds
vim.keymap.set({ "n", "v", "i" }, "<C-S>", "<C-c>:update<cr>", { silent = true, desc = "Save file" })

-- buffer re-maps
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "<C-w>h - Traverse to left buffer" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "<C-w>j - Traverse to bottom buffer" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "<C-w>k - Traverse to top buffer" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "<C-w>l - Traverse to right buffer" })
