-- kanagawa
return {
  -- https://github.com/rebelot/kanagawa.nvim
  'rebelot/kanagawa.nvim', -- You can replace this with your favorite colorscheme
  lazy = false,            -- We want the colorscheme to load immediately when starting Neovim
  priority = 1000,         -- Load the colorscheme before other non-lazy-loaded plugins
  opts = {
    -- Replace this with your scheme-specific settings or remove to use the defaults
    -- transparent = true,
    background = {
      -- light = "lotus",
      dark = "wave", -- "wave, dragon"
    },
    -- Remove the background of LineNr, {Sign,Fold}Column and friends
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "none"
          }
        }
      }
    },
    -- Transparent Floating Windows
    overrides = function(colors)
      local theme = colors.theme
      return {
        TelescopeTitle = { fg = theme.ui.special, bold = true },
        TelescopePromptNormal = { bg = theme.ui.bg_p1 },
        TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
        TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
        TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
        TelescopePreviewNormal = { bg = theme.ui.bg_dim },
        TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
        PmenuSbar = { bg = theme.ui.bg_m1 },
        PmenuThumb = { bg = theme.ui.bg_p2 },
      }
    end,
  },
  config = function(_, opts)
    require('kanagawa').setup(opts) -- Replace this with your favorite colorscheme
    vim.cmd("colorscheme kanagawa") -- Replace this with your favorite colorscheme
  end
}

-- Sonokai Theme
-- return {
--   -- https://github.com/sainnhe/sonokai
--   'sainnhe/sonokai',
--   lazy = false,                     -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000,                  -- Load the colorscheme before other non-lazy-loaded plugins
--   config = function(_, opts)
--     vim.g.sonokai_style = "default" -- "default, atlantis, andromeda, shusia, maia, espresso"
--     vim.cmd("colorscheme sonokai")  -- Replace this with your favorite colorscheme
--   end
-- }

-- One Nord Theme
-- return {
--   -- https://github.com/rmehri01/onenord.nvim
--   'rmehri01/onenord.nvim',
--   lazy = false,                    -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000,                 -- Load the colorscheme before other non-lazy-loaded plugins
--   config = function()
--     vim.cmd("colorscheme onenord") -- Replace this with your favorite colorscheme
--   end
-- }

-- catppuccin
-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			flavour = "mocha", -- latte, frappe, macchiato, mocha
-- 			background = { -- :h background
-- 				light = "latte",
-- 				dark = "mocha",
-- 			},
-- 			transparent_background = true, -- disables setting the background color.
-- 			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
-- 			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
-- 			dim_inactive = {
-- 				enabled = false, -- dims the background color of inactive window
-- 				shade = "dark",
-- 				percentage = 0.15, -- percentage of the shade to apply to the inactive window
-- 			},
-- 			no_italic = false, -- Force no italic
-- 			no_bold = false, -- Force no bold
-- 			no_underline = false, -- Force no underline
-- 			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
-- 				comments = { "italic" }, -- Change the style of comments
-- 				conditionals = { "italic" },
-- 				loops = {},
-- 				functions = {},
-- 				keywords = {},
-- 				strings = {},
-- 				variables = {},
-- 				numbers = {},
-- 				booleans = {},
-- 				properties = {},
-- 				types = {},
-- 				operators = {},
-- 			},
-- 			integrations = {
-- 				telescope = {
-- 					enabled = true,
-- 				},
-- 				cmp = true,
-- 				gitsigns = true,
-- 				treesitter = true,
-- 				notify = false,
-- 				mini = {
-- 					enabled = true,
-- 					indentscope_color = "",
-- 				},
-- 			},
-- 		})
--
-- 		vim.cmd.colorscheme("catppuccin")
-- 	end,
-- }
