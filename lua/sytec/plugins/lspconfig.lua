-- Set up completion using nvim_cmp with LSP source
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local servers = require("sytec.lsp_settings.servers")

		require("mason").setup({})
		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = servers.lsps,
		})

		local nvim_lsp_config = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local setup_opts = {
			capabilities,
		}

		-- ui
		vim.diagnostic.config({
			signs = true,
			underline = true,
			update_in_insert = false,
			virtual_text = { prefix = "●" },
			severity_sort = true,
			float = {
				source = "always", -- Or "if_many"
			},
		})

		local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		-- borders
		-- To instead override globally
		local border = {
			{ "🭽", "FloatBorder" },
			{ "▔", "FloatBorder" },
			{ "🭾", "FloatBorder" },
			{ "▕", "FloatBorder" },
			{ "🭿", "FloatBorder" },
			{ "▁", "FloatBorder" },
			{ "🭼", "FloatBorder" },
			{ "▏", "FloatBorder" },
		}
		local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or border
			return orig_util_open_floating_preview(contents, syntax, opts, ...)
		end

		-- servers
		for _, server in pairs(servers.lsps) do
			if server == "intelephense" then
				local intelephense_opts = require("sytec.lsp_settings.intelephense")
				setup_opts = vim.tbl_deep_extend("force", intelephense_opts, setup_opts)
			end

			if server == "lua_ls" then
				local lua_opts = {
					settings = {
						Lua = {
							diagnostics = {
								-- Get the language server to recognize the `vim` global
								globals = { "vim" },
							},

							workspace = {
								-- Make the server aware of Neovim runtime files
								library = vim.api.nvim_get_runtime_file("", true),
								checkThirdParty = false,
							},
						},
					},
				}

				setup_opts = vim.tbl_deep_extend("force", lua_opts, setup_opts)
			end

			if server == "cssls" then
				local cssls_opts = {
					settings = {
						css = {
							validate = true,
							lint = {
								unknownAtRules = "ignore",
							},
						},
						scss = {
							validate = true,
							lint = {
								unknownAtRules = "ignore",
							},
						},
						less = {
							validate = true,
							lint = {
								unknownAtRules = "ignore",
							},
						},
					},
				}
				setup_opts = vim.tbl_deep_extend("force", cssls_opts, setup_opts)
			end

			nvim_lsp_config[server].setup(setup_opts)
		end

		-- keymaps
		vim.keymap.set("n", "<C-n>", vim.diagnostic.goto_next)
		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local local_keymap_opts = { buffer = ev.buf }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, local_keymap_opts)
				vim.keymap.set("n", "gf", vim.lsp.buf.references, local_keymap_opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, local_keymap_opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.rename, local_keymap_opts)
				vim.keymap.set("n", "ga", vim.lsp.buf.code_action, local_keymap_opts)
			end,
		})
	end,
}
