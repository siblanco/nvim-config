return {
  'smoka7/hop.nvim',
  version = "*",
  config = function()
    require('hop').setup {
      keys = 'neitsrlpufd'
    }

    local keymap = vim.keymap

    keymap.set({ 'n', 'v' }, 'h', "<cmd>:HopWord<cr>")
  end
}
