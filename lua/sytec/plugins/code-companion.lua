return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",                      -- Optional: For using slash commands and variables in the chat buffer
    "nvim-telescope/telescope.nvim",         -- Optional: For using slash commands
    { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
  },
  config = function()
    require("codecompanion").setup({
      display = {
        chat = {
          window = {
            width = 0.5,
          },
        },
      },
      actions = {
        -- Define a custom action for refactoring
        refactor = {
          prompt = "I need to refactor the following code to improve readability, maintainability, and reduce code repetition. Please analyze the code and suggest refactoring changes with explanations:\n\n{{selection}}",
          mode = { "n", "v" },
          icon = "󰁌",
          title = "Refactor Code",
          palette = true,  -- Add this to action palette
        }
      },
      adapters = {
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                default = "claude-3.7-sonnet",
              },
            },
          })
        end,
      },
    })
  end
}
