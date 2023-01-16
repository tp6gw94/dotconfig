local lsp = require("lsp-zero")
local saga = require("lspsaga")

saga.init_lsp_saga({ symbol_in_winbar = {
  enable = true,
} })

lsp.preset("recommended")
lsp.ensure_installed({
  "tsserver",
  "eslint",
  "sumneko_lua",
})
lsp.set_preferences({
  set_lsp_keymaps = false,
})
lsp.nvim_workspace()
lsp.on_attach(function(client, bufnr) end)

local cmp = require("cmp")
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.abort(),
  ["<Tab>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
})
local compare = cmp.config.compare

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  sources = {
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "friendly-snippets" },
    { name = "copilot" },
  },
  sorting = {
    compare.locality,
    compare.recently_used,
    compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
    compare.offset,
    compare.order,
    -- require("copilot_cmp.comparators").prioritize,
    -- require("copilot_cmp.comparators").score,
  },
})
lsp.setup()
