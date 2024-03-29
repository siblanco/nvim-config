return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("harpoon").setup({
			global_settings = {
				-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
				save_on_toggle = false,

				-- saves the harpoon file upon every change. disabling is unrecommended.
				save_on_change = true,

				-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
				enter_on_sendcmd = false,

				-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
				tmux_autoclose_windows = false,

				-- filetypes that you want to prevent from adding to the harpoon list menu.
				excluded_filetypes = { "harpoon" },

				-- set marks specific to each git branch inside git repository
				mark_branch = false,

				-- enable tabline with harpoon marks
				tabline = false,
			},
			menu = {
				width = 95,
			},
		})

		-- Harpoon
		vim.keymap.set("n", "<leader>e", function()
			require("harpoon.ui").toggle_quick_menu()
		end)
		vim.keymap.set("n", "ti", function()
			require("harpoon.ui").nav_next()
		end)
		vim.keymap.set("n", "tm", function()
			require("harpoon.ui").nav_prev()
		end)
		vim.keymap.set("n", "<leader>a", function()
			require("harpoon.mark").add_file()
		end)
		vim.keymap.set("n", "<leader>x", function()
			require("harpoon.ui").nav_file(1)
		end)
		vim.keymap.set("n", "<leader>c", function()
			require("harpoon.ui").nav_file(2)
		end)
		vim.keymap.set("n", "<leader>d", function()
			require("harpoon.ui").nav_file(3)
		end)
		vim.keymap.set("n", "<leader>r", function()
			require("harpoon.ui").nav_file(4)
		end)
		vim.keymap.set("n", "<leader>s", function()
			require("harpoon.ui").nav_file(5)
		end)
		vim.keymap.set("n", "<leader>t", function()
			require("harpoon.ui").nav_file(6)
		end)
	end,
}
