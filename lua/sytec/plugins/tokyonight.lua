require("tokyonight").setup({
  styles  = {
    comments = {
      italic = true
    },
    functions = {
      italic = true
    },
    sidebars = "normal",
    floats = "normal"
  }
})

vim.cmd [[colorscheme tokyonight-night]]
vim.cmd("hi HopNextKey guifg=#f7768e")
vim.cmd("hi HopNextKey1 guifg=#f7768e")
vim.cmd("hi HopNextKey2 guifg=#f7768e")
