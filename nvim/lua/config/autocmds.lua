-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("harpoon"),
  pattern = {
    "harpoon",
  },
  callback = function()
    local set = vim.keymap.set
    local ui = require("harpoon.ui")
    for i = 0, 9 do
      set("n", tostring(i), function()
        ui.nav_file(i)
      end, { desc = "Navigate to harpoon file " .. tostring(i) })
    end
  end,
})
