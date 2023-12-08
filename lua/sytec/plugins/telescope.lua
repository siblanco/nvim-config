local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close,
        ['<c-d>'] = require('telescope.actions').delete_buffer
      },
      i = {
        ['<c-d>'] = require('telescope.actions').delete_buffer
      },
    },
    preview = {
      filesize_hook = function(filepath, bufnr, opts)
        local max_bytes = 10000
        local cmd = { 'head', '-c', max_bytes, filepath }
        require('telescope.previewers.utils').job_maker(cmd, bufnr, opts)
      end
    }
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ['i'] = {
          ['<C-w>'] = function() vim.cmd('normal vbd') end,
        },
        ['n'] = {
          -- your custom normal mode mappings
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
          ['/'] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
    }
  },
}

telescope.load_extension('file_browser')
telescope.load_extension("live_grep_args")
telescope.load_extension("git_worktree")
telescope.load_extension("ui-select")

vim.keymap.set('n', 'sf',
  function()
    builtin.find_files({
      no_ignore = false,
      find_command = {
        'rg',
        '--files',
        '--hidden',
        '-g',
        '!.git',
        '-g',
        '!vendor',
        '-g',
        '!dist',
        '-g',
        '!out'
      },
    })
  end)
vim.keymap.set('n', 'sg', function()
  telescope.extensions.live_grep_args.live_grep_args({
    default_text = "-g '!*dist*' -g '!*vendor*' "
  })
end)
vim.keymap.set('n', 'so', function()
  builtin.oldfiles()
end)
vim.keymap.set('n', 'sb', function()
  builtin.buffers()
end)
vim.keymap.set('n', 'sr', function()
  builtin.resume()
end)
vim.keymap.set('n', 'sc', function()
  telescope.extensions.git_worktree.git_worktrees()
end)
vim.keymap.set('n', 'sC', function()
  telescope.extensions.git_worktree.create_git_worktree()
end)
vim.keymap.set('n', 'sd', function()
  builtin.diagnostics()
end)
vim.keymap.set('n', 'st', function()
  builtin.filetypes()
end)
vim.keymap.set('n', 'se', function()
  telescope.extensions.file_browser.file_browser({
    path = '%:p:h',
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = 'normal',
    layout_config = { height = 40 }
  })
end)
