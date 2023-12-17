--vim.lsp.set_log_level("debug")
local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local protocol = require("vim.lsp.protocol")
local servers = require("sytec.lsp_settings.servers")

protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})

local opts = {
	capabilities,
}

for _, server in pairs(servers.lsps) do
	if server == "intelephense" then
		local intelephense_opts = require("sytec.lsp_settings.intelephense")
		opts = vim.tbl_deep_extend("force", intelephense_opts, opts)
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

		opts = vim.tbl_deep_extend("force", lua_opts, opts)
	end

	if server == "denols" then
		local denols_opts = {
			root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
		}
		opts = vim.tbl_deep_extend("force", denols_opts, opts)
	end

	if server == "tsserver" then
		local tsserver_opts = {
			single_file_support = false,
		}
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end

	if server == "pylsp" then
		local pyright_opts = {
			filetypes = { "python" },
			root_dir = nvim_lsp.util.root_pattern("requirements.txt", ".git"),
		}
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
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
		opts = vim.tbl_deep_extend("force", cssls_opts, opts)
	end

	nvim_lsp[server].setup(opts)
end
