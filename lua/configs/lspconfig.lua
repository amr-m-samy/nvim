-- NvChad's defaults() (called from plugins/init.lua) already sets on_attach, on_init and
-- capabilities for every server through vim.lsp.config("*"), so servers only need enabling here.

local servers = {
	"html",
	"cssls",
	"clangd",
	"somesass_ls",
	"ts_ls",
	"bashls",
	"lua_ls",
	"tailwindcss",
	"lemminx", -- XML (Odoo views)
	"jsonls",
	"pyright", -- Python: types, completion, go-to-definition
	"ruff", -- Python: lint diagnostics and quick fixes (replaces flake8)
}

-- Odoo source/addons paths so pyright resolves `from odoo import ...` and addon imports.
-- Only folders that exist on this machine are used, so Odoo 18 and 19 installs both work.
local function odoo_paths()
	local candidates = {}
	for _, root in ipairs({ "/opt/odoo19", "/opt/odoo18" }) do
		vim.list_extend(candidates, { root .. "/odoo", root .. "/odoo/addons", root .. "/addons" })
	end
	-- Odoo's default data dir for downloaded/enterprise addons, e.g. ~/.local/share/Odoo/addons/19.0
	vim.list_extend(candidates, vim.fn.glob(vim.fn.expand("~/.local/share/Odoo/addons/*"), false, true))
	return vim.tbl_filter(function(p)
		return vim.fn.isdirectory(p) == 1
	end, candidates)
end

vim.lsp.config("pyright", {
	settings = {
		pyright = {
			disableOrganizeImports = true, -- Ruff sorts imports
		},
		python = {
			analysis = {
				extraPaths = odoo_paths(),
				typeCheckingMode = "basic",
			},
		},
	},
})

-- Let pyright handle hover; Ruff's hover only shows rule docs.
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("ruff_no_hover", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.name == "ruff" then
			client.server_capabilities.hoverProvider = false
		end
	end,
})

vim.lsp.enable(servers)
