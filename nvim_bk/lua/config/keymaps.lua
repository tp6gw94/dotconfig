-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map({ "n", "v" }, "<S-l>", "$")
map({ "n", "v" }, "<S-h>", "_")
map({ "n", "v" }, "<C-u>", "<C-u>zz")
map({ "n", "v" }, "<C-d>", "<C-d>zz")
map("n", "<S-g>", "<S-g>zz")
map("n", "<C-i>", "<C-i>")
map("v", "<leader>p", '"0p', { desc = "paste without yank" })
map("v", "<leader>d", '"_d', { desc = "delete without yank" })
map("n", "<C-o>", "<C-o>zz")
map("n", "<C-i>", "<C-i>zz")
