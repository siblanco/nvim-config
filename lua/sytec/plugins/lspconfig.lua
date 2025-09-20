return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local servers = require("sytec.lsp_settings.servers")

    require("mason").setup({})
    local mason_tool_installer = require("mason-tool-installer")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- ui
    vim.diagnostic.config({
      signs = true,
      underline = true,
      update_in_insert = false,
      virtual_text = { prefix = "●" },
      severity_sort = true,
      float = {
        source = "always", -- Or "if_many"
      },
    })

    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- borders
    -- To instead override globally
    local border = {
      { "🭽", "FloatBorder" },
      { "▔", "FloatBorder" },
      { "🭾", "FloatBorder" },
      { "▕", "FloatBorder" },
      { "🭿", "FloatBorder" },
      { "▁", "FloatBorder" },
      { "🭼", "FloatBorder" },
      { "▏", "FloatBorder" },
    }
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or border
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    -- servers
    for _, server in pairs(servers.lsps) do
      local current_server_opts = {}

      local success, loaded_opts = pcall(require, "sytec.lsp_settings." .. server)
      if success then
        current_server_opts = loaded_opts
      end
      local server_setup_opts = vim.tbl_deep_extend("force", current_server_opts, {
        capabilities = capabilities,
      })

      vim.lsp.enable(server)
      vim.lsp.config(server, server_setup_opts)
    end

    mason_tool_installer.setup({
      ensure_installed = {
        "markdownlint",
        "jsonlint",
        "stylelint",
        "prettierd",
        "blade-formatter"
      },
    })

    -- keymaps
    vim.keymap.set("n", "<C-n>", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<C-p>", vim.diagnostic.goto_prev)
    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local local_keymap_opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, local_keymap_opts)
        vim.keymap.set("n", "gf", vim.lsp.buf.references, local_keymap_opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, local_keymap_opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.rename, local_keymap_opts)
      end,
    })
  end,
}
