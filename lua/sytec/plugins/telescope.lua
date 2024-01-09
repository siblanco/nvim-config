return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-telescope/telescope-live-grep-args.nvim", "nvim-telescope/telescope-ui-select.nvim" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				mappings = {
					n = {
						["q"] = actions.close,
						["<c-d>"] = require("telescope.actions").delete_buffer,
					},
					i = {
						["<c-d>"] = require("telescope.actions").delete_buffer,
					},
				},
				preview = {
					filesize_hook = function(filepath, bufnr, opts)
						local max_bytes = 10000
						local cmd = { "head", "-c", max_bytes, filepath }
						require("telescope.previewers.utils").job_maker(cmd, bufnr, opts)
					end,
				},
			},
			extensions = {
				live_grep_args = {
					auto_quoting = true, -- enable/disable auto-quoting
				},
			},
		})

		telescope.load_extension("live_grep_args")
		telescope.load_extension("ui-select")

		vim.keymap.set("n", "sf", function()
			builtin.find_files({
				no_ignore = false,
				find_command = {
					"rg",
					"--files",
					"--hidden",
					"-g",
					"!.git",
					"-g",
					"!vendor",
					"-g",
					"!dist",
					"-g",
					"!out",
					"-g",
					"!generated",
				},
			})
		end)
		vim.keymap.set("n", "sg", function()
			telescope.extensions.live_grep_args.live_grep_args({
				default_text = "-g '!*dist*' -g '!*vendor*' -g '!*generated*' ",
			})
		end)
		vim.keymap.set("n", "so", function()
			builtin.oldfiles()
		end)
		vim.keymap.set("n", "sb", function()
			builtin.buffers()
		end)
		vim.keymap.set("n", "sr", function()
			builtin.resume()
		end)
		vim.keymap.set("n", "st", function()
			builtin.filetypes()
		end)
	end,
}
