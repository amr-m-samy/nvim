return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				-- This will not install any breaking changes.
				-- For major updates, this must be adjusted manually.
				version = "^1.0.0",
			},
		},
		config = function()
			require("telescope").load_extension("live_grep_args")
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
			"html",
			"xml",
			"jsx",
		},
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
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
