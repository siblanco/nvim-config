require("oil").setup({
	skip_confirm_for_simple_edits = true,
	-- Selecting a new/moved/renamed file or directory will prompt you to save changes first
	prompt_save_on_select_new_entry = true,
	keymaps = {
		["h"] = "actions.parent",
		["<C-s>"] = false,
		["<C-h>"] = false,
		["<C-t>"] = false,
		["<C-p>"] = false,
		["<C-c>"] = false,
		["<C-l>"] = false,
	},
	view_options = {
		show_hidden = true,
	},
})
