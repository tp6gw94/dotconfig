return {
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "graphql",
    "json",
    "tsx",
    "markdown_inline",
    "markdown",
    "python",
    "rust",
    "toml",
    "yaml",
  },
  indent = {
    enable = true,
  },
  context_commentstring = { enable = true, enable_autocmd = false },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
}
