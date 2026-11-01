-- Single source of truth for formatting (the old duplicate spec in plugins/my_formatting.lua was removed).
local prettier = require("conform.formatters.prettier")

local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		-- Ruff replaces black (formatting) and isort (import sorting); output is black-compatible.
		python = { "ruff_organize_imports", "ruff_format" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		-- XML (Odoo views) uses its own formatter so the XML plugin flag never breaks JS/CSS/JSON formatting.
		xml = { "prettier_xml", lsp_format = "fallback" },
	},

	formatters = {
		ruff_format = {
			-- Keep the 79-character limit you used with black. A project's pyproject.toml/ruff.toml line-length
			-- is overridden by this flag, so delete it if you prefer per-project settings.
			args = { "format", "--line-length", "79", "--force-exclude", "--stdin-filename", "$FILENAME", "-" },
		},
		-- Used only when the project has `npm install --save-dev @prettier/plugin-xml`;
		-- otherwise XML falls back to the lemminx language server's formatter.
		prettier_xml = vim.tbl_extend("force", prettier, {
			prepend_args = { "--plugin=@prettier/plugin-xml", "--xml-whitespace-sensitivity=ignore" },
			condition = function(_, ctx)
				local root = vim.fs.root(ctx.dirname, "node_modules")
				return root ~= nil and vim.fn.isdirectory(root .. "/node_modules/@prettier/plugin-xml") == 1
			end,
		}),
	},

	-- Format on save, unless turned off with :FormatToggle (globally) or :FormatToggle! (this buffer only).
	format_on_save = function(bufnr)
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 2000, lsp_format = "fallback" }
	end,
}

require("conform").setup(options)

vim.api.nvim_create_user_command("FormatToggle", function(args)
	if args.bang then
		vim.b.disable_autoformat = not vim.b.disable_autoformat
		vim.notify("Format on save (buffer): " .. (vim.b.disable_autoformat and "off" or "on"))
	else
		vim.g.disable_autoformat = not vim.g.disable_autoformat
		vim.notify("Format on save: " .. (vim.g.disable_autoformat and "off" or "on"))
	end
end, { desc = "Toggle format on save (! = current buffer only)", bang = true })
