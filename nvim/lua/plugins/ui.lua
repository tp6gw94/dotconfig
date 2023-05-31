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
    keys = {
      { "gb", "<Cmd>BufferLinePick<CR>", desc = "Pick Buffer" },
    },
    opts = {
      options = {
        style_preset = require("bufferline").style_preset.minimal,
        separator_style = "thin",
      },
    },
  },
}
