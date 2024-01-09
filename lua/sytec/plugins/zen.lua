return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({
			window = {
				width = 100,
				options = {},
			},
		})

		-- zen mode
		vim.keymap.set("n", "<leader>zz", function()
			require("zen-mode").toggle()
		end)
	end,
}
