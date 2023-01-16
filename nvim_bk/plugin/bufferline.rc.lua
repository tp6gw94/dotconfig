require('bufferline').setup({
  options = {
    offsets = {
      { filetype = "NvimTree", text = "", padding = 1 }
    },
    show_buffer_icons = true,
    highlights = {
      fill = {
        guifg = { attribute = "fg", highlight = "#ff0000" },
        guibg = { attribute = "bg", highlight = "TabLine" },
      },
      background = {
        guifg = { attribute = "fg", highlight = "TabLine" },
        guibg = { attribute = "bg", highlight = "TabLine" },
      },

      -- buffer_selected = {
      --   guifg = {attribute='fg',highlight='#ff0000'},
      --   guibg = {attribute='bg',highlight='#0000ff'},
      --   gui = 'none'
      --   },
      buffer_visible = {
        guifg = { attribute = "fg", highlight = "TabLine" },
        guibg = { attribute = "bg", highlight = "TabLine" },
      },

      close_button = {
        guifg = { attribute = "fg", highlight = "TabLine" },
        guibg = { attribute = "bg", highlight = "TabLine" },
      },
      close_button_visible = {
        guifg = { attribute = "fg", highlight = "TabLine" },
        guibg = { attribute = "bg", highlight = "TabLine" },
      },
      -- close_button_selected = {
      --   guifg = {attribute='fg',highlight='TabLineSel'},
      --   guibg ={attribute='bg',highlight='TabLineSel'}
      --   },

      tab_selected = {
        guifg = { attribute = "fg", highlight = "Normal" },
        guibg = { attribute = "bg", highlight = "Normal" },
      },
      tab = {
        guifg = { attribute = "fg", highlight = "TabLine" },
        guibg = { attribute = "bg", highlight = "TabLine" },
      },
      tab_close = {
        -- guifg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
        guifg = { attribute = "fg", highlight = "TabLineSel" },
        guibg = { attribute = "bg", highlight = "Normal" },
      },

      duplicate_selected = {
        guifg = { attribute = "fg", highlight = "TabLineSel" },
        guibg = { attribute = "bg", highlight = "TabLineSel" },
        gui = "italic",
      },
      duplicate_visible = {
        guifg = { attribute = "fg", highlight = "TabLine" },
        guibg = { attribute = "bg", highlight = "TabLine" },
        gui = "italic",
      },
      duplicate = {
        guifg = { attribute = "fg", highlight = "TabLine" },
        guibg = { attribute = "bg", highlight = "TabLine" },
        gui = "italic",
      },

      modified = {
        guifg = { attribute = "fg", highlight = "TabLine" },
        guibg = { attribute = "bg", highlight = "TabLine" },
      },
      modified_selected = {
        guifg = { attribute = "fg", highlight = "Normal" },
        guibg = { attribute = "bg", highlight = "Normal" },
      },
      modified_visible = {
        guifg = { attribute = "fg", highlight = "TabLine" },
        guibg = { attribute = "bg", highlight = "TabLine" },
      },

      separator = {
        guifg = { attribute = "bg", highlight = "TabLine" },
        guibg = { attribute = "bg", highlight = "TabLine" },
      },
      separator_selected = {
        guifg = { attribute = "bg", highlight = "Normal" },
        guibg = { attribute = "bg", highlight = "Normal" },
      },
      -- separator_visible = {
      --   guifg = {attribute='bg',highlight='TabLine'},
      --   guibg = {attribute='bg',highlight='TabLine'}
      --   },
      indicator_selected = {
        guifg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
        guibg = { attribute = "bg", highlight = "Normal" },
      },
    }
  }
})
