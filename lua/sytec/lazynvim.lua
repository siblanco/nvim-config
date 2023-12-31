local plugins = {
	-- "folke/tokyonight.nvim",
	-- "rebelot/kanagawa.nvim",
	-- { "ellisonleao/gruvbox.nvim", priority = 1000, config = true},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	"feline-nvim/feline.nvim",
	"nvim-lualine/lualine.nvim",
	"folke/zen-mode.nvim",
	"ThePrimeagen/git-worktree.nvim",

	"christoomey/vim-tmux-navigator",

	{
		"nvim-lua/plenary.nvim",
		lazy = false,
	},

	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/nvim-cmp",
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	"siblanco/nvim-snippets",

	{
		"numToStr/Comment.nvim",
	},

	"nvimdev/lspsaga.nvim",

	"nvim-treesitter/nvim-treesitter",

	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},

	"kyazdani42/nvim-web-devicons",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-live-grep-args.nvim", "nvim-telescope/telescope-ui-select.nvim" },
		},
	},
	"nvim-telescope/telescope-file-browser.nvim",
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	"norcalli/nvim-colorizer.lua",

	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	"junegunn/gv.vim",

	"tpope/vim-repeat",
	"tpope/vim-surround",
	"moll/vim-bbye",
	"nvimdev/indentmini.nvim",

	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	"phaazon/hop.nvim",
	"prisma/vim-prisma",
	"stevearc/oil.nvim",
	"stevearc/conform.nvim",
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
}

local opts = {}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)
