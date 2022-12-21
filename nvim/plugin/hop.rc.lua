local hop = require("hop")
local directions = require("hop.hint").HintDirection

vim.keymap.set("n", "<leader>hc", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { remap = true })

vim.keymap.set("n", "<leader>hw", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { remap = true })

vim.keymap.set("v", "<leader>hc", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { remap = true })

vim.keymap.set("v", "<leader>hw", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { remap = true })
