vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.clipboard:append { 'unnamedplus' }
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.smartcase = true -- smart case
vim.opt.timeoutlen = 400 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 50  -- faster completion (4000ms default)

vim.opt.undofile = true  -- enable persistent undo
-- vim.opt.undodir = os.getenv("HOME") .. "/.nvim-undo-dir"
vim.opt.undodir = "/tmp/"

vim.wo.number = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true          -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*', '*/vendor/*', '*/.git/*' }
vim.opt.relativenumber = true
vim.g.PHP_autoformatcomment = 0

vim.opt.numberwidth = 3
vim.opt.statuscolumn = "%=%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''}%=%s"
