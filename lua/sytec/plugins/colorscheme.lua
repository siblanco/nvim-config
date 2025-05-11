-- return {
--   'rebelot/kanagawa.nvim',
--   config = function()
--     -- Default options:
--     require('kanagawa').setup({
--       compile = true,   -- enable compiling the colorscheme
--       undercurl = true, -- enable undercurls
--       commentStyle = { italic = true },
--       functionStyle = { bold = true },
--       keywordStyle = { italic = true },
--       statementStyle = { bold = true },
--       typeStyle = {},
--       transparent = false,   -- do not set background color
--       dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
--       terminalColors = true, -- define vim.g.terminal_color_{0,17}
--       colors = {             -- add/modify theme and palette colors
--         palette = {},
--         theme = {
--           wave = {
--             syn = {
--               -- constant = palette_colors.springViolet2,
--               -- parameter = palette_colors.surimiOrange
--             }
--           },
--           lotus = {},
--           dragon = {},
--           all = {
--           }
--         },
--       },
--       theme = "wave",  -- Load "wave" theme when 'background' option is not set
--       background = {   -- map the value of 'background' option to a theme
--         dark = "wave", -- try "dragon" !
--         light = "lotus"
--       },
--     })
--
--     vim.cmd.colorscheme 'kanagawa'
--     vim.cmd("hi HopNextKey guifg=#f7768e")
--     vim.cmd("hi HopNextKey1 guifg=#f7768e")
--     vim.cmd("hi HopNextKey2 guifg=#f7768e")
--   end,
-- }

-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   config = function()
--     vim.cmd("colorscheme rose-pine")
--   end
-- }

-- Using lazy.nvim
return {
  "fnune/standard",
  lazy = false,
  priority = 1000,
  config = function()
    require("standard").setup({})
    vim.cmd("colorscheme standard")
  end,
}
