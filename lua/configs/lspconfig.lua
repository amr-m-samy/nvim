local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local servers =
	{ "html", "cssls", "clangd", "somesass_ls", "cssls", "ts_ls", "bashls", "lua_ls", "tailwindcss", "lemminx" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.pyright.setup({
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
