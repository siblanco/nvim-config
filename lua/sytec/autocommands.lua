-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd([[
      autocmd BufEnter * set formatoptions-=cro
      autocmd BufEnter * setlocal formatoptions-=cro
    ]])
  end,
})

vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = { "neomutt*" },
  callback = function()
    require("cmp").setup.buffer({ enabled = false })
  end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 300 })
  end,
})

vim.api.nvim_create_user_command("W", "noautocmd w", { bang = true })
vim.api.nvim_create_user_command("Wq", "noautocmd wq", { bang = true })

local blade_group = vim.api.nvim_create_augroup("BladeFiletypeRelated", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = blade_group,
  pattern = "*.blade.php",
  command = "set ft=blade",
})
