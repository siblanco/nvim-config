return {
  "stevearc/conform.nvim",
  event = { "BufWritePre", "BufNewFile" },
  config = function()
    require("conform").setup({
      format_on_save = function()
        -- auto apply all code actions (for eslint autofixes)
        vim.lsp.buf.code_action({
          filter = function(a) return a.isPreferred end,
          apply = true
        })
        return { timeout_ms = 500, lsp_fallback = true, async = false }
      end,

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
      },
    })
  end,
}
