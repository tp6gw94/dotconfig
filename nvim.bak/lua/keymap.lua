-- move
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true, expr = false })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true, expr = false })
vim.keymap.set("n", "L", "$", { silent = true, expr = false })
vim.keymap.set("n", "H", "_", { silent = true, expr = false })
-- move on wrap
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- window focus move
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- resize window
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- move lines
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv")

-- delete and paste
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete" })
vim.keymap.set("v", "<leader>p", '"_dP', { desc = "Replace" })

-- nohl
vim.keymap.set("n", "<esc>", ":nohl<cr>", { desc = "nohl" })

-- undo break point
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
