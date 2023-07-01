return {
  on_attach = function(bufnr)
    local api = require('nvim-tree.api') 
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split') )
    vim.keymap.set('n', 'h', api.node.open.horizontal, opts('Open: Horizontal Split'))
  end,
  git = {
      enable = true
    },
    renderer = {
      highlight_git = true,
      icons = {
        show = {
          git = true
        }
      }
    }
}
