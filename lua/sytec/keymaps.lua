local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "

keymap("n", "x", '"_x')

-- Increment/decrement
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- stay at end after yank
keymap("v", "y", "ygv<Esc>")

-- close buffer
keymap("n", "tc", "<cmd>Bdelete!<CR>")
keymap("n", "ca", "<cmd>bufdo bd<CR>")
keymap("n", "cq", "<cmd>call setqflist([])<CR><cmd>cclose<cr>")
keymap("n", "co", "<cmd>copen<cr>")

-- Split window
keymap("n", "ss", ":vsplit<CR><C-w>w")
keymap("n", "sv", ":vsplit<CR><C-w>w")
keymap("n", "sh", ":split<CR><C-w>w")

keymap("n", "tn", ":tabNext<CR>")
keymap("n", "te", ":tabedit<CR>")

-- Resize with arrows
keymap("n", "<C-S-Right>", ":vertical resize +5<CR>")
keymap("n", "<C-S-Left>", ":vertical resize -5<CR>")
keymap("n", "<C-S-Up>", ":horizontal resize +5<CR>")
keymap("n", "<C-S-Down>", ":horizontal resize -5<CR>")

-- easier quit / save
keymap("n", "<leader>q", ":q<CR>")
keymap("n", "<leader>Q", ":qa!<CR>")
keymap("n", "<leader>w", ":w<CR>")

-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
keymap("v", "p", '"_dP')

-- sessions
keymap('n', '<leader>ss', ':mks! ~/Downloads/')
keymap('n', '<leader>sl', ':source ~/Downloads/')

keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>")
keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>")
keymap("n", "<leader>ca", "<cmd>CodeCompanionChat Toggle<cr>")
keymap("v", "<leader>ca", "<cmd>CodeCompanionChat Toggle<cr>")
keymap("v", "<leader>cp", "<cmd>CodeCompanionChat Add<cr>")
vim.cmd([[cab cc CodeCompanion]])

keymap('i', 'jk', '<esc>')

keymap("n", "sc", "<cmd>CodeCompanionActions<cr>")
keymap("v", "sc", "<cmd>CodeCompanionActions<cr>")
keymap("n", "<leader>ca", "<cmd>CodeCompanionChat Toggle<cr>")
keymap("v", "<leader>ca", "<cmd>CodeCompanionChat Toggle<cr>")
keymap("v", "<leader>cp", "<cmd>CodeCompanionChat Add<cr>")

function insertFullPath()
  local filepath = vim.fn.expand('%')
  vim.fn.setreg('+', filepath) -- write to clippoard
end

vim.keymap.set('n', '<leader>cp', insertFullPath, { noremap = true, silent = true })

-- keymap("n", "<C-e>", function()
--   local result = vim.treesitter.get_captures_at_cursor(0)
--   print(vim.inspect(result))
-- end)

-- auto apply eslint fix all
local function quickfix()
  vim.lsp.buf.code_action({
    filter = function(a) return a.isPreferred end,
    apply = true
  })
end

keymap('n', '<leader>sq', quickfix)
