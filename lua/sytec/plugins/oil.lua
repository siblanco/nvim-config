require("oil").setup({
  skip_confirm_for_simple_edits = true,
  -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
  prompt_save_on_select_new_entry = true,
  keymaps = {
      ["h"] = "actions.parent",
  },
})
