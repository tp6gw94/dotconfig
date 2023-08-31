return {
  -- {
  --   "ThePrimeagen/harpoon",
  --   config = function()
  --     require("harpoon").setup({})
  --   end,
  --   init = function()
  --     local set = vim.keymap.set
  --     local ui = require("harpoon.ui")
  --     set("n", "<tab>e", function()
  --       ui.toggle_quick_menu()
  --     end, { desc = "Harpoon menu" })
  --     set("n", "<tab>m", function()
  --       require("harpoon.mark").add_file()
  --       print("Mark file to harpoon")
  --     end, { desc = "Mark file to harpoon" })
  --
  --     set("n", "<tab>n", function()
  --       ui.nav_next()
  --     end, { desc = "Next harpoon marker" })
  --     set("n", "<tab>p", function()
  --       ui.nav_prev()
  --     end, { desc = "Previous harpoon marker" })
  --   end,
  -- },
  {
    "mbbill/undotree",
    init = function()
      vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  --   init = function()
  --     require("chatgpt").setup()
  --   end,
  -- },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension("frecency")
    end,
    dependencies = { "kkharji/sqlite.lua" },
    keys = {
      {
        "<tab>e",
        function()
          require("telescope").extensions.frecency.frecency({ workspace = "CWD" })
        end,
      },
    },
    enabled = false,
  },
  {
    "j-morano/buffer_manager.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      {
        "<Tab>e",
        function()
          require("buffer_manager.ui").toggle_quick_menu()
        end,
        desc = "Buffers",
      },
    },
  },
}
