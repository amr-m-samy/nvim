return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = { enable = true },
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			--     require "plugins.config.lspconfig"
			--     require "custom.config.lspconfig"
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"black",
				"debugpy",
				"flake8",
				"eslint_d",
				"lua-language-server",
				"pyright",
				"stylua",
				"prettier",
				"typescript-language-server",
				"htmlhint",
				"html-lsp",
				"css-lsp",
				"tailwindcss-language-server",
			},
		},
	},
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",

		opts = {
			autotag = {
				enable = true,
			},
			ensure_installed = {
				-- defaults
				"vim",
				"lua",
				"vimdoc",

				-- web dev
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"python",

				-- low level
				"c",
			},
		},
	},
}
