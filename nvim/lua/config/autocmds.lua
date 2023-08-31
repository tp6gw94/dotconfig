-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("buffer-manager"),
  pattern = {
    "buffer_manager-menu",
  },
  callback = function(event)
    local set = vim.keymap.set
    for i = 1, 9 do
      set("n", tostring(i), function()
        require("buffer_manager.ui").nav_file(i)
      end, { silent = true, buffer = event.buf })
    end
  end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   group = augroup("harpoon"),
--   pattern = {
--     "harpoon",
--   },
--   callback = function(event)
--     local set = vim.keymap.set
--     local ui = require("harpoon.ui")
--
--     for i = 1, 9 do
--       set("n", tostring(i), function()
--         ui.nav_file(i)
--       end, { desc = "Navigate to harpoon file " .. tostring(i), buffer = event.buf, silent = true })
--     end
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   group = augroup("harpoon_buffer_mark"),
--   callback = function(event)
--     local mark = require("harpoon.mark")
--     local curr_harpoon_idx = mark.get_current_index()
--     local new_list = {}
--
--     if curr_harpoon_idx == nil then
--       table.insert(new_list, 1, event.file)
--     else
--       table.insert(new_list, 1, mark.get_marked_file_name(curr_harpoon_idx))
--     end
--
--     for i = 1, mark.get_length() do
--       if curr_harpoon_idx ~= i then
--         table.insert(new_list, mark.get_marked_file_name(i))
--       end
--     end
--
--     mark.set_mark_list(new_list)
--
--     if mark.get_length() > 9 then
--       mark.rm_file(mark.get_marked_file_name(10))
--     end
--   end,
-- })

-- vim.api.nvim_create_autocmd("BufDelete", {
--   group = augroup("harpoon_buffer_delete"),
--   callback = function(event)
--     local mark = require("harpoon.mark")
--     if mark.get_marked_file(event.file) ~= nil then
--       mark.rm_file(event.file)
--     end
--   end,
-- })
