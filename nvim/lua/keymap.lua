local opts = { noremap = true, silent = true }
local bind = vim.keymap.set

bind("i", "jk", "<ESC>", opts)
bind("n", "<C-d>", "<C-d>zz", opts)
bind("n", "<C-u>", "<C-u>zz", opts)

bind("n", "<C-h>", "<C-w>h", opts)
bind("n", "<C-j>", "<C-w>j", opts)
bind("n", "<C-k>", "<C-w>k", opts)
bind("n", "<C-l>", "<C-w>l", opts)

bind("n", "<C-Up>", ":resize +2<CR>", opts)
bind("n", "<C-Down>", ":resize -2<CR>", opts)
bind("n", "<C-Left>", ":vertical resize -2<CR>", opts)
bind("n", "<C-Right>", ":vertical resize +2<CR>", opts)

bind("n", "<S-l>", ":bnext<CR>", opts)
bind("n", "<S-h>", ":bprevious<CR>", opts)

bind("v", "<", "<gv", opts)
bind("v", ">", ">gv", opts)

bind("x", "J", ":move '>+1<CR>gv-gv", opts)
bind("x", "K", ":move '<-2<CR>gv-gv", opts)

bind("n", "<leader>h", ":nohl<cr>", opts)

bind("n", "<Leader>e", ":NvimTreeToggle<cr>", opts)
bind("n", "<Leader>c", "<cmd>bw<cr>", opts)

bind("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
-- bind("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help<cr>", opts)
bind("n", "gd", "<cmd>Lspsaga lsp_finder<cr>", opts)
bind("n", "gp", "<cmd>Lspsaga preview_definition<cr>", opts)
bind("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", opts)
bind("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", opts)
bind("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)

bind("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", opts)

bind("n", "<leader>s", "<cmd>SymbolsOutline<cr>", opts)

bind("n", "<leader>f", "<cmd>Telescope git_files<cr>", opts)
bind("n", "<leader>F", "<cmd>Telescope find_files<cr>", opts)
bind("n", "<leader>lg", "<cmd>Telescope live_grep", opts)

bind("n", "<leader>u", "<cmd>UndotreeToggle<cr>", opts)

bind("n", "<C-e>", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', opts)
bind("n", "<C-m>", '<cmd>lua require("harpoon.mark").add_file()<cr>', opts)
bind("n", "<F1>", '<cmd>lua require("harpoon.ui").nav_file(1)<cr>', opts)
bind("n", "<F2>", '<cmd>lua require("harpoon.ui").nav_file(2)<cr>', opts)
bind("n", "<F3>", '<cmd>lua require("harpoon.ui").nav_file(3)<cr>', opts)
bind("n", "<F4>", '<cmd>lua require("harpoon.ui").nav_file(4)<cr>', opts)
bind("n", "<F5>", '<cmd>lua require("harpoon.ui").nav_file(5)<cr>', opts)

bind("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
bind("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)

bind("n", "<leader>d", '"_d', opts)
bind("v", "<leader>d", '"_d', opts)
bind("v", "<leader>p", '"_dP', opts)
