local status, tree = pcall(require, "nvim-tree")
if not status then
  return
end
local tree_cb = require("nvim-tree.config").nvim_tree_callback

tree.setup({
  view = {
    width = 30,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = {
        {
          key = "<C-e>",
          cb = function()
            vim.api.nvim_command('lua require("harpoon.ui").toggle_quick_menu()')
          end,
        },
        { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
        { key = "h", cb = tree_cb("close_node") },
        { key = "v", cb = tree_cb("vsplit") },
      },
    },
    number = false,
    relativenumber = false,
  },
})
