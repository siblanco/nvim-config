return {
  "mfussenegger/nvim-dap",

  dependencies = {
    "nvim-neotest/nvim-nio",

    {
      "rcarriga/nvim-dap-ui",
      -- stylua: ignore
      keys = {
        { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
        { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
      },
      opts = {},
      config = function(_, opts)
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup(opts)
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open({})
        end
      end,
    },

    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },

    {
      'mxsdev/nvim-dap-vscode-js',
      dependencies = {
        {
          "microsoft/vscode-js-debug",
          version = "1.x",
          build = "npm i && npm run compile vsDebugServerBundle && mv dist out"
        }
      },
      config = function()
        require("dap-vscode-js").setup({
          node_path = "node",                                                    -- Path of node executable. Defaults to $NODE_PATH, and then "node"
          debugger_path = "/Users/sytec/.local/share/nvim/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
          -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
          adapters = { 'pwa-node', 'pwa-chrome', 'node', 'chrome' },             -- which adapters to register in nvim-dap
          -- log_file_path = "(stdpath cache)/dap_vscode_js.log",                  -- Path for file logging
          log_file_level = false,                                                -- Logging level for output to file. Set to false to disable file logging.
          -- log_console_level = vim.log.levels
          -- .ERROR                                                                -- Logging level for output to console. Set to false to disable console output.
        })
      end
    }
  },

  -- stylua: ignore
  keys         = {
    { "<leader>dc", function() require("dap").continue() end },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
    { "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end,                                                desc = "Go to line (no execute)" },
    { "<leader>di", function() require("dap").step_into() end,                                            desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end,                                                 desc = "Down" },
    { "<leader>dk", function() require("dap").up() end,                                                   desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end,                                             desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end,                                             desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end,                                            desc = "Step Over" },
    { "<leader>dp", function() require("dap").pause() end,                                                desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end,                                          desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end,                                              desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end,                                            desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end,                                     desc = "Widgets" },
  },

  config       = function()
    local js_based_languages = { "typescript", "javascript", "typescriptreact" }

    vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })

    require('dap.ext.vscode').load_launchjs(nil,
      {
        ['pwa-node'] = js_based_languages,
        ['node'] = js_based_languages,
        ['chrome'] = js_based_languages,
        ['pwa-chrome'] = js_based_languages
      }
    )
  end,
}
