require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = false,
	},

	formatters_by_ft = {
		php = { "php_cs_fixer" },
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
	},
})
