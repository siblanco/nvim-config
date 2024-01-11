return {
	"luckasRanarison/clear-action.nvim",
	opts = {
		silent = true, -- dismiss code action requests errors
		signs = {
			enable = false,
		},
		popup = { -- replaces the default prompt when selecting code actions
			enable = true,
			center = false,
			border = "rounded",
			hide_cursor = false,
			hide_client = true, -- hide displaying name of LSP client
			highlights = {
				header = "CodeActionHeader",
				label = "CodeActionLabel",
				title = "CodeActionTitle",
			},
		},
		mappings = {
			-- The values can either be a string or a string tuple (with description)
			-- example: "<leader>aq" | { "<leader>aq", "Quickfix" }
			-- Or if you want more control: { key = "<leader>aq", mode = { "n" }, options = { desc = "Quickfix" } }
			-- `options` accetps the same keys as vim.keymap.set()
			code_action = "ga", -- a modified version of `vim.lsp.buf.code_action`
		},
		-- This is used for filtering actions in the quickfix functions
		-- It's a map of diagnostic codes and the preferred action prefixes
		-- You can check the diagnostic codes by hovering on the diagnostic
		quickfix_filters = {
			-- example:
			-- ["rust_analyzer"] = {
			--   ["E0433"] = "Import",
			-- },
			-- ["lua_ls"] = {
			--   ["unused-local"] = "Disable diagnostics on this line",
			-- },
		},
	},
}
