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
  callback = function(event)
    local set = vim.keymap.set
    local ui = require("harpoon.ui")
    for i = 1, 9 do
      set("n", tostring(i), function()
        ui.nav_file(i)
      end, { desc = "Navigate to harpoon file " .. tostring(i), buffer = event.buf, silent = true })
    end
  end,
})
