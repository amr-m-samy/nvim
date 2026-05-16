local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

-- Removed the duplicate "cssls" from this list
local servers = {
	"html",
	"cssls",
	"clangd",
	"somesass_ls",
	"ts_ls",
	"bashls",
	"lua_ls",
	"tailwindcss",
	"lemminx",
}

-- 1. Configure and enable standard servers
for _, lsp in ipairs(servers) do
	vim.lsp.config(lsp, {
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
	})
	vim.lsp.enable(lsp)
end

-- 2. Configure and enable Pyright with Odoo paths
vim.lsp.config("pyright", {
	on_init = on_init,
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				-- autoSearchPaths = true,
				-- useLibraryCodeForTypes = true,
				extraPaths = {
					"/opt/odoo18/odoo",
					"/opt/odoo18/odoo/addons",
					"/home/master/.local/share/Odoo/addons/18.2/",
					"/opt/odoo18/addons",
				},
			},
		},
	},
})
vim.lsp.enable("pyright")

-- Without the loop, you would have to manually set up each LSP
--
-- lspconfig.html.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
-- lspconfig.cssls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
