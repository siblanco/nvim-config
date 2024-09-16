return {
  "stevearc/conform.nvim",
  event = { "BufWritePre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      format_on_save = { timeout_ms = 2500, lsp_fallback = true, async = false },

      formatters_by_ft = {
        php = { "php_cs_fixer" },
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        vue = { "prettier" },
        json = { "prettier" },
        scss = { "prettier" },
        css = { "prettier" },
        mjs = { "prettier" },
        astro = { "prettier" },
        twig = { "twig-cs-fixer" },
        java = { "google-java-format" },
        blade = { "blade-formatter" }
      },
    })
  end,
}
