local lsp = require('lsp-zero')
local saga = require('lspsaga')

saga.init_lsp_saga({ symbol_in_winbar = {
  enable = true
} })

lsp.preset('recommended')
lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua'
})
lsp.set_preferences({
  set_lsp_keymaps = false
})
lsp.nvim_workspace()
lsp.on_attach(function(client, bufnr)
end)
local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<Tab>'] = cmp.mapping.confirm({ select = true })
})
lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})
lsp.setup()
