local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

local servers = require "sytec.lsp_settings.servers"

mason.setup {}

lspconfig.setup {
  automatic_installation = true,
  ensure_installed = servers.list
}
