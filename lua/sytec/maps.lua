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
keymap('n', 'ca', '<cmd>bufdo bd<CR>')
keymap('n', 'cq', '<cmd>call setqflist([])<CR>')

-- nav buffers
keymap('n', 'ti', ':bnext<CR>')
keymap('n', 'tm', ':bprevious<CR>')

-- Split window
keymap('n', 'ss', ':vsplit<Return><C-w>w')
keymap('n', 'sh', ':split<Return><C-w>w')

-- Resize with arrows
keymap("n", "<C-S-Up>", ":vertical resize +5<CR>")
keymap("n", "<C-S-Down>", ":vertical resize -5<CR>")

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

-- Harpoon
keymap("n", "<leader>e", function ()
  require("harpoon.ui").toggle_quick_menu()
end)
keymap("n", "<leader>a", function ()
  require("harpoon.mark").add_file()
end)
keymap("n", "<leader>x", function ()
  require("harpoon.ui").nav_file(1)
end)
keymap("n", "<leader>c", function ()
  require("harpoon.ui").nav_file(2)
end)
keymap("n", "<leader>d", function ()
  require("harpoon.ui").nav_file(3)
end)
keymap("n", "<leader>r", function ()
  require("harpoon.ui").nav_file(4)
end)
keymap("n", "<leader>s", function ()
  require("harpoon.ui").nav_file(5)
end)
keymap("n", "<leader>t", function ()
  require("harpoon.ui").nav_file(6)
end)

-- zen mode
keymap("n", "<leader>zz", function()
    require("zen-mode").toggle()
end)
