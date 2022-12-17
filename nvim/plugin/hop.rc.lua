local hop = require('hop')
local directions = require('hop.hint').HintDirection

vim.keymap.set('n', 's', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})

vim.keymap.set('n', 'S', function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})
