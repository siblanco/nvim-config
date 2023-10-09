local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "

keymap('n', 'x', '"_x')

-- Increment/decrement
keymap('n', '+', '<C-a>')
keymap('n', '-', '<C-x>')

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G')

-- stay at end after yank
keymap('v', 'y', 'ygv<Esc>')

-- close buffer
keymap('n', 'tc', '<cmd>Bdelete!<CR>')
keymap('n', '<leader>ca', '<cmd>bufdo bd<CR>')
keymap('n', '<leader>cq', '<cmd>call setqflist([])<CR>')

-- Split window
keymap('n', 'ss', ':vsplit<Return><C-w>w')
keymap('n', 'sh', ':split<Return><C-w>w')

-- undotree
keymap('n', '<leader>u', ':UndotreeToggle<CR><C-w>w')

-- Resize with arrows
keymap("n", "<C-S-Up>", ":resize +3<CR>")
keymap("n", "<C-S-Down>", ":resize -1<CR>")
keymap("n", "<C-S-Left>", ":vertical resize +3<CR>")
keymap("n", "<C-S-Right>", ":vertical resize -1<CR>")

-- window movement
keymap("n", "<C-Up>", "<C-w>k")
keymap("n", "<C-Down>", "<C-w>j")
keymap("n", "<C-Left>", "<C-w>h")
keymap("n", "<C-Right>", "<C-w>l")

-- fugitive
keymap("n", "<leader>g", ":Gedit :<CR>")
keymap("n", "<leader>p", ":G push")
keymap("t", "<Esc>", "<C-\\><C-n>")

-- basic func maps
keymap("n", "<leader>q", ":q<CR>")
keymap("n", "<leader>w", ":w<CR>")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

keymap("v", "p", '"_dP')

keymap('n', '<C-f>', function()
  require('illuminate').goto_next_reference()
end)
keymap('n', '<C-b>', function()
  require('illuminate').goto_prev_reference()
end)

keymap('v', '<C-f>', function()
  require('illuminate').goto_next_reference()
end)
keymap('v', '<C-b>', function()
  require('illuminate').goto_prev_reference()
end)
