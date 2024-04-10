return {
  'smoka7/hop.nvim',
  version = "*",
  config = function()
    require('hop').setup {
      -- create_hl_autocmd = false,
      keys = 'tnseridpufcy'
    }

    local keymap = vim.keymap

    keymap.set({ 'n', 'v' }, 'h', "<cmd>:HopWord<cr>")
    keymap.set({ 'n', 'v' }, 'l', "<cmd>:HopLine<cr>")
  end
}
