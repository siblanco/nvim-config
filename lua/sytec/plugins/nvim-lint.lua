return {
	"mfussenegger/nvim-lint",
	event = { "BufWritePre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			astro = { "eslint_d" },
			markdown = { "markdownlint" },
			vue = { "eslint_d" },
			json = { "jsonlint" },
			scss = { "stylelint" },
			css = { "stylelint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			group = lint_augroup,
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
