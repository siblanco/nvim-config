---@diagnostic disable: missing-fields

return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "nvim-treesitter/nvim-treesitter-context", "nvim-treesitter/nvim-treesitter-textobjects" },
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        "vimdoc",
        "markdown",
        "regex",
        "markdown_inline",
        "bash",
        "css",
        "html",
        "javascript",
        "json",
        "php",
        "scss",
        "typescript",
        "vim",
        "lua",
        "c",
        "twig",
        "python",
        "glimmer",
        "astro",
        "pug",
      }, -- one of "all" or a list of languages
      autotag = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["ac"] = "@conditional.outer",
            ["ic"] = "@conditional.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
          },
        },
      },
    })

    vim.treesitter.language.register("markdown", "mdx") -- the someft filetype will use the python parser and queries.
    -- Repeat movement with ; and ,
    -- ensure ; goes forward and , goes backward regardless of the last direction
    local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
  end,
}
