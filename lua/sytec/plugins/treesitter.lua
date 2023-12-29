local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
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
