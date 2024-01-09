return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>g", ":Gedit :<CR>")
		vim.keymap.set("n", "<leader>p", ":G push")
	end,
}
