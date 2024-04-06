return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {
    { '<leader>fe', '<cmd>Neotree toggle<cr>', desc = '[F]ile [E]xplore' },
  },
  config = function()
    require('neo-tree').setup {
      window = {
        mappings = {
          ['l'] = 'open',
          ['h'] = 'close_node',
          ['m'] = {
            'move',
            config = {
              show_path = 'relative',
            },
          },
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    }
  end,
}
