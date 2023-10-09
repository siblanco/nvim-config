local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use "folke/tokyonight.nvim"

  use 'feline-nvim/feline.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'folke/zen-mode.nvim'

  use 'nvim-lua/plenary.nvim'           -- Common utilities
  use 'hrsh7th/cmp-buffer'              -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'            -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'                -- Completion
  use 'neovim/nvim-lspconfig'           -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'L3MON4D3/LuaSnip'
  use { "saadparwaiz1/cmp_luasnip" }     -- snippet completions
  use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use
  use 'siblanco/nvim-snippets'
  use 'tpope/vim-commentary'

  use { 'nvimdev/lspsaga.nvim' }

  use "RRethy/vim-illuminate"

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use {
    'nvim-treesitter/nvim-treesitter-context',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }

  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })

  use 'kyazdani42/nvim-web-devicons' -- File icons
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
  }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'

  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use 'junegunn/gv.vim'

  use { "tpope/vim-repeat" }
  use { "tpope/vim-surround" }
  use "moll/vim-bbye"
  use "nvimdev/indentmini.nvim"
  use { "folke/trouble.nvim", config = function()
    require('trouble').setup {}
  end }

  use "ThePrimeagen/harpoon"

  use "phaazon/hop.nvim"
  use "prisma/vim-prisma"
  use "zbirenbaum/copilot.lua"
end)
