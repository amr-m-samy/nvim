return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "black" },
				-- Use a sub-list to run only the first available formatter
				javascript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				typescript = { "prettier" },
				xml = { "prettier" },
			},
			formatters = {
				black = {
					command = "black",
					prepend_args = { "--line-length", "79" },
					-- args = { "--line-length=79" },
					stdin = true,
				},
				prettier = {
					-- command = "/home/deb/.local/share/nvim/mason/packages/prettier/node_modules/.bin/prettier",
					command = "prettier",
					-- Must install xml plugin for Prettier on each project using npm : npm install --save-dev @prettier/plugin-xml because it is not working globally (I don't know why)
					args = {
						"--stdin-filepath",
						"$FILENAME", -- let Prettier infer parser from filename"
						"--plugin=@prettier/plugin-xml",
						-- "--print-width=80",
						-- "--tab-width=2",
						-- "--xml-quote-attributes=double",
						"--xml-whitespace-sensitivity=ignore",
						-- "--xml-whitespace-sensitivity",
						-- "--single-attribute-per-line",
						-- "--bracket-same-line",
					},
				},
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
