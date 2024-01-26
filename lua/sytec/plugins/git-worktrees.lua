return {
  "ThePrimeagen/git-worktree.nvim",
  event = "VeryLazy",
  config = function()
    require("telescope").load_extension("git_worktree")
    vim.keymap.set("n", "gw", function()
      require('telescope').extensions.git_worktree.git_worktrees()
    end)
    vim.keymap.set("n", "gW", function()
      require('telescope').extensions.git_worktree.create_git_worktree()
    end)
  end,
}
