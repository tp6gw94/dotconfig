local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local servers = { "html", "cssls", "graphql" }

for _, server in pairs(servers) do
  lspconfig[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { "rust" },
  root_dir = util.root_pattern "Cargo.toml",
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}

require("typescript").setup {
  disable_commands = false,
  debug = true,
  go_to_source_definition = {
    fallback = true,
  },
  server = {
    on_attach = on_attach,
  },
}
local builtin = require "statuscol.builtin"

require("statuscol").setup {
  relculright = true,
  segments = {
    { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
    { text = { "%s" }, click = "v:lua.ScSa" },
    { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
  },
}

require("ufo").setup()
