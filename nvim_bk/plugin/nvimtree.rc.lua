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
        { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
        { key = "h", cb = tree_cb("close_node") },
        { key = "v", cb = tree_cb("vsplit") },
      },
    },
    number = false,
    relativenumber = false,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
})
