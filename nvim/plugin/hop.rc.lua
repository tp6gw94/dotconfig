local hop = require("hop")
local directions = require("hop.hint").HintDirection

vim.keymap.set("n", "<C-f>", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { remap = true })

vim.keymap.set("n", "<C-w>", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { remap = true })

vim.keymap.set("v", "<C-f>", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { remap = true })
