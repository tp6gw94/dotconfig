return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      enable_git_status = true,
      enable_diagostics = true,
      window = {
        position = "left",
        width = 40,
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
          never_show = {
            ".DS_Store",
          },
          follow_current_file = true,
          window = {
            mappings = {
              ["H"] = "toggle_hidden",
            },
          },
        },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    -- enabled = false,
  },
  -- {
  --
  --   "romgrk/barbar.nvim",
  --   event = "BufEnter",
  --   dependencies = {
  --     "lewis6991/gitsigns.nvim",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   init = function() end,
  --   opts = {
  --     sidebar_filetypes = {
  --       ["neo-tree"] = { event = "BufWipeout" },
  --     },
  --   },
  --   keys = {
  --     { "<tab><tab>", "<Cmd>BufferPick<CR>", desc = "Pick Buffer" },
  --     { "<tab>p", "<Cmd>BufrerPin<CR>", desc = "Buffer Pin" },
  --     { "[b", "<Cmd>BufferPrevious<CR>", desc = "Buffer Previous" },
  --     { "]b", "<Cmd>BufferNext<CR>", desc = "Buffer Next" },
  --     { "<leader>br", "<Cmd>BufferScrollRight<CR>", desc = "Buffer Scroll Right" },
  --     { "<leader>bl", "<Cmd>BufferScrollLeft<CR>", desc = "Buffer Scroll Left" },
  --   },
  -- },
}
