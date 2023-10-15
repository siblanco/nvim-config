require('hop').setup {
  create_hl_autocmd = false,
  keys = 'neitsrlpufd'
}

local keymap = vim.keymap

-- keymap.set('n', 'h', "<cmd>lua require'hop'.hint_words()<cr>")
keymap.set('n', 'h', function()
  require 'hop'.hint_words()
  -- vim.cmd("norm zz")
end)

keymap.set('n', 'l', function()
  require 'hop'.hint_lines_skip_whitespace()
  -- vim.cmd("norm zz")
end)
keymap.set('v', 'h', function()
  require 'hop'.hint_words()
  -- vim.cmd("norm zz")
end)

keymap.set('v', 'l', function()
  require 'hop'.hint_lines_skip_whitespace()
  -- vim.cmd("norm zz")
end)

-- reimplement f / F
keymap.set('n', 'f',
  "<cmd>:lua require'hop'.hint_char1({direction = require'hop.hint'.HintDirection.AFTER_CURSOR,current_line_only = true})<cr>")
keymap.set('n', 'F',
  "<cmd>:lua require'hop'.hint_char1({direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,current_line_only = true})<cr>")
