return {
  "stevearc/conform.nvim",
  event = { "BufWritePre", "BufNewFile" },
  config = function()
    require("conform").setup({
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
        async = false,
      },

      formatters_by_ft = {
        php = { "php_cs_fixer" },
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        vue = { "prettierd" },
        json = { "prettierd" },
        scss = { "prettierd" },
        css = { "prettierd" },
        astro = { "prettier" },
        twig = { "twig-cs-fixer" },
        java = { "google-java-format" },
      },
    })
  end,
}
