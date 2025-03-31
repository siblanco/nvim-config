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
      prompt_library = {
        ["Refactor Code"] = {
          strategy = "chat",
          description = "Improve readability, maintainability, and reduce code repetition",
          opts = {
            mapping = "<LocalLeader>rf",
            modes = { "n", "v" },
            short_name = "refactor",
            auto_submit = true,
            stop_context_insertion = true,
          },
          prompts = {
            {
              role = "system",
              content = function(context)
                return "You are an expert " .. context.filetype .. " developer with extensive experience in refactoring code. Focus on improving readability, maintainability, and reducing code repetition."
              end,
            },
            {
              role = "user",
              content = function(context)
                local text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)
                
                return "I need to refactor the following code:\n\n```" .. context.filetype .. 
                       "\n" .. text .. "\n```\n\n" ..
                       "Please analyze this code and suggest specific refactoring improvements to enhance readability, maintainability, and reduce code repetition. " ..
                       "Provide a clear explanation for each suggestion, focusing on real improvements rather than stylistic preferences. " ..
                       "Present your suggestions in a structured format with code examples."
              end,
              opts = {
                contains_code = true,
              }
            },
          },
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
