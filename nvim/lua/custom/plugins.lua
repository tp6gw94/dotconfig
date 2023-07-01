---@type NvPluginSpec[]
local plugins = {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "echasnovski/mini.surround",
    keys = function(_, keys)
      -- Populate the keys based on the user's options
      local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      local mappings = {
        { opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
        { opts.mappings.delete, desc = "Delete surrounding" },
        { opts.mappings.find, desc = "Find right surrounding" },
        { opts.mappings.find_left, desc = "Find left surrounding" },
        { opts.mappings.highlight, desc = "Highlight surrounding" },
        { opts.mappings.replace, desc = "Replace surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        add = "gza", -- Add surrounding in Normal and Visual modes
        delete = "gzd", -- Delete surrounding
        find = "gzf", -- Find surrounding (to the right)
        find_left = "gzF", -- Find surrounding (to the left)
        highlight = "gzh", -- Highlight surrounding
        replace = "gzr", -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
  },
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
  -- stylua: ignore
  keys = {
    { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
  },
  },
  {
    "ggandor/flit.nvim",
    keys = function()
      ---@type LazyKeys[]
      local ret = {}
      for _, key in ipairs { "f", "F", "t", "T" } do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
  },
  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      -- fold
      {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async", "luukvbaal/statuscol.nvim" },
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  { "williamboman/mason.nvim", opts = require "custom.configs.mason" },
  { "nvim-treesitter/nvim-treesitter", opts = require "custom.configs.treesitter" },
  { "nvim-tree/nvim-tree.lua", opts = require "custom.configs.nvim-tree" },
  {
    "j-morano/buffer_manager.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      {
        "<C-e>",
        function()
          require("buffer_manager.ui").toggle_quick_menu()
        end,
        desc = "Buffers",
      },
    },
  },
  {
    "Exafunction/codeium.vim",
    lazy = false,
    config = function()
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<C-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<C-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<C-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
    end,
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },
  {
    "L3MON4D3/LuaSnip",
    build = (not jit.os:find "Windows")
        and "echo -e 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
      or nil,
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = false,
      region_check_events = "InsertEnter",
      delete_check_events = "InsertLeave",
    },
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          -- return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
          return "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = require "custom.configs.cmp",
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" },
      { "nvim-tree/nvim-web-devicons" },
      { "neovim/nvim-lspconfig" },
    },
    config = function()
      require("lspsaga").setup {
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
      }
    end,
  },
  {
    "folke/which-key.nvim",
    keys = { "<leader>", '"', "'", "`", "c", "v", "g" },
    init = function()
      require("core.utils").load_mappings "whichkey"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      local wk = require "which-key"
      wk.register {
        ["<leader>"] = {
          x = { name = "+Trouble" },
          s = { name = "+Search" },
          b = { name = "+Buffer" },
          c = { name = "+Code" },
          w = { name = "+Window" },
          g = { name = "+Git" },
          n = { name = "+Nvchad" },
          f = { name = "+File" },
        },
      }
      wk.setup(opts)
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}

return plugins
