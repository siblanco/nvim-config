return {
  'smoka7/hop.nvim',
  version = "*",
  config = function()
    require('hop').setup {
      -- create_hl_autocmd = false,
    }

    local keymap = vim.keymap

    keymap.set({ 'n', 'v' }, 'm', "<cmd>:HopWord<cr>")
  end
}
