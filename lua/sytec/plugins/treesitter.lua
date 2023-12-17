local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"markdown",
		"regex",
		"markdown_inline",
		"bash",
		"css",
		"html",
		"javascript",
		"json",
		"php",
		"scss",
		"typescript",
		"vim",
		"lua",
		"c",
		"twig",
		"python",
		"glimmer",
		"astro",
		"pug",
	}, -- one of "all" or a list of languages
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
