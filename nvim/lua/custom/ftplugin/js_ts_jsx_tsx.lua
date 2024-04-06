vim.keymap.set('n', '<leader>tu', function()
  vim.cmd 'TSToolsRemoveUnusedImports'
  vim.cmd 'TSToolsRemoveUnused'
end, { desc = '[T]ypescript Remove [U]nused' })

vim.keymap.set('n', '<leader>te', function()
  vim.cmd 'silent !eslint_d --fix %'
  vim.cmd 'edit!'
end, { desc = '[T]ypescript [E]slint fix' })
