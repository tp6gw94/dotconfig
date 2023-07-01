local M = {}

M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<leader>n"] = "",
    ["<leader>v"] = "",
    ["<leader>h"] = "",
    ["<leader>D"] = "",
    ["<leader>fm"] = "",
    ["<leader>x"] = "",
    ["<leader>b"] = "",
    ["<leader>cm"] = "",
    ["<leader>ma"] = "",
    ["<leader>pt"] = "",
    ["<leader>ra"] = "",
    ["<leader>rn"] = "",
    ["<leader>ch"] = "",
    ["<C-c>"] = "",
    ["<leader>ls"] = "",
    ["<leader>th"] = "",
    ["<leader>td"] = "",
    ["<leader>wk"] = "",
    ["<leader>wK"] = "",
    ["<leader>wl"] = "",
    ["<leader>wr"] = "",
    ["<leader>wa"] = "",
    ["<leader>rh"] = "",
    ["<leader>ph"] = "",
    ["<leader>fz"] = "",
    ["<leader>fw"] = "",
    ["<leader>fh"] = "",
  },
}

M.nvchad = {
  n = {
    ["<leader>nm"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },
    ["<leader>nt"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
  },
}

M.git = {
  n = {
    ["<leader>gb"] = {
      function()
        local gs = package.loaded.gitsigns
        gs.toggle_current_line_blame()
      end,
      "Toggle Git Blame",
    },
    ["<leader>gg"] = { "<cmd>LazyGit<CR>", "Lazy Git" },
    ["<leader>gd"] = {
      function()
        local gs = package.loaded.gitsigns
        gs.diffthis()
      end,
      "Git Diff",
    },
    ["<leader>gD"] = {
      function()
        local gs = package.loaded.gitsigns
        gs.diffthis "~"
      end,

      "Git Diff ~",
    },
  },
}

M.search = {
  n = {
    ["<leader>sr"] = {
      function()
        require("specture").open()
      end,
      "Replace files",
    },
    ["<leader>sg"] = { "<cmd>Telescope grep_string<cr>", "Grep string" },
    ["<leader>sz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
  },
}

M.general = {
  n = {
    ["L"] = { "$", "", opts = { nowait = true } },
    ["H"] = { "_", "", opts = { nowait = true } },
    ["<C-u>"] = { "<C-u>zz", "" },
    ["<C-d>"] = { "<C-d>zz", "" },
  },
  v = {
    ["L"] = { "$", "", opts = { nowait = true } },
    ["H"] = { "_", "", opts = { nowait = true } },
    ["<leader>p"] = { '"0p', "Paste without yank" },
    ["<leader>d"] = { '"_d', "Delete without yank" },
  },
  i = {
    [","] = { ",<c-g>u" },
    ["."] = { ".<c-g>u" },
    [";"] = { ";<c-g>u" },
  },
}

M.buffer = {
  n = {
    ["<leader>bx"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "Toggle Nvim Tree" },
  },
}

M.lspsaga = {
  n = {
    ["gd"] = { "<cmd>Lspsaga lsp_finder<cr>", "Lsp Finder" },
    ["gp"] = { "<cmd>Lspsaga peek_definition<cr>", "Peek Definition" },
    ["K"] = { "<cmd>Lspsaga hover_doc<cr>", "Hover Doc" },
    ["<leader>ca"] = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
    ["<leader>cr"] = { "<cmd>Lspsaga rename<cr>", "Rename" },
    ["<leader>cd"] = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
  },
}

M.trouble = {
  n = {
    ["<leader>xx"] = { "<cmd>TroubleToggle<cr>", "Trouble" },
    ["<leader>xw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
    ["<leader>xd"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
    ["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
  },
}

M.window = {
  n = {
    ["<leader>ww"] = { "<C-W>p", "Other window" },
    ["<leader>wd"] = { "<C-W>c", "Close window" },
    ["<leader>w-"] = { "<C-W>s", "Split window below" },
    ["<leader>w|"] = { "<C-W>v", "Split window right" },
  },
}

return M
