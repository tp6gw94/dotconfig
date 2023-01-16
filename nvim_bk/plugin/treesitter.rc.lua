require('nvim-treesitter.configs').setup({
  ensure_installed = {"c", "lua",  "typescript"},
  auto_install = true,
  highlight = {
    enable = true
  }
})
