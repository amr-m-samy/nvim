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
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
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
