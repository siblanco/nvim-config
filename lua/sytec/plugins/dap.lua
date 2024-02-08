return {
  "mfussenegger/nvim-dap",

  dependencies = {
    -- fancy UI for the debugger
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
          dapui.open({ reset = true })
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close({})
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close({})
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
        "microsoft/vscode-js-debug",
      },
      config = function()
        require("dap-vscode-js").setup({
          node_path = "node",                                                   -- Path of node executable. Defaults to $NODE_PATH, and then "node"
          debugger_path = "/home/sytec/.local/share/nvim/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
          -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
          adapters = { 'pwa-node' },                                            -- which adapters to register in nvim-dap
          -- log_file_path = "(stdpath cache)/dap_vscode_js.log",                  -- Path for file logging
          log_file_level = false,                                               -- Logging level for output to file. Set to false to disable file logging.
          -- log_console_level = vim.log.levels
          -- .ERROR                                                                -- Logging level for output to console. Set to false to disable console output.
        })

        for _, language in ipairs({ "typescript", "javascript" }) do
          -- https://github.com/microsoft/vscode-js-debug/blob/main/OPTIONS.mdhttps://github.com/microsoft/vscode-js-debug/blob/main/OPTIONS.md
          require("dap").configurations[language] = {
            {
              type = "pwa-node",
              request = "launch",
              name = "Launch:pp:api",
              cwd = "${workspaceFolder}/apps/api",
              runtimeArgs = { 'run-script', 'dev:api' },
              runtimeExecutable = 'npm',
              skipFiles = { '<node_internals>/**', 'node_modules/**' },
              enableDWARF = false,
              resolveSourceMapLocations = {
                "${workspaceFolder}/**",
                "!**/node_modules/**",
                "!**/.vite/**",
              },
              console = 'integratedTerminal',
            },
            {
              type = "pwa-node",
              request = "launch",
              name = "Launch:pp:iam",
              cwd = "${workspaceFolder}/apps/iam",
              runtimeArgs = { 'run-script', 'dev:iam' },
              runtimeExecutable = 'npm',
              skipFiles = { '<node_internals>/**', 'node_modules/**' },
              enableDWARF = false,
              resolveSourceMapLocations = {
                "${workspaceFolder}/**",
                "!**/node_modules/**",
                "!**/.vite/**",
              },
              console = 'integratedTerminal',
            },
          }
        end
      end
    }
  },

  -- stylua: ignore
  keys         = {
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end,                                             desc = "Continue" },
    { "<leader>da", function() require("dap").continue({ before = get_args }) end,                        desc = "Run with Args" },
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
    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
  end,
}
