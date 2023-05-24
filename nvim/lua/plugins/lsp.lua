return {
  {
    "styled-components/vim-styled-components",
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" },
      { "nvim-tree/nvim-web-devicons" },
      { "neovim/nvim-lspconfig" },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "Code Action", mode = { "n", "v" } }
      keys[#keys + 1] = { "<leader>cr", "<cmd>Lspsaga rename<CR>", desc = "Rename" }
      keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover Doc" }
      keys[#keys + 1] = { "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show Line Diagnostics" }
      keys[#keys + 1] = { "gp", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" }
      keys[#keys + 1] = { "gd", "<cmd>Lspsaga lsp_finder<CR>", desc = "LSP Finder" }
    end,
    config = function()
      require("lspsaga").setup({
        finder = {
          max_height = 0.5,
          min_width = 30,
          force_max_height = false,
          keys = {
            jump_to = "l",
            expand_or_jump = "<CR>",
            vsplit = "|",
            split = "-",
            tab = "t",
            quit = { "q", "<ESC>" },
            close_in_preview = "<ESC>",
          },
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    init = function() end,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<leader>o", ":SymbolsOutline<CR>", desc = "Symbols Outline" }
    end,
  },
}
