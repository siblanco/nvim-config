return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local codecompanion_status = require('sytec.plugins.codecompanion.lualine')
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "tokyonight",
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename", codecompanion_status },
        lualine_x = {},
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
