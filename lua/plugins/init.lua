return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo", "FormatToggle" },
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
		config = function(_, opts)
			-- Keep NvChad's telescope setup (layout, theme), then add the extension.
			require("telescope").setup(opts)
			require("telescope").load_extension("live_grep_args")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = { enable = true },
			view = {
				adaptive_size = true, -- Automatically adjust the width of the tree
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	{
		"mason-org/mason.nvim",
		opts = {
			-- Install everything below with :MasonInstallAll
			ensure_installed = {
				-- Python
				"pyright",
				"ruff",
				"debugpy",
				-- Lua
				"lua-language-server",
				"stylua",
				-- Web
				"typescript-language-server",
				"html-lsp",
				"css-lsp",
				"some-sass-language-server",
				"tailwindcss-language-server",
				"json-lsp",
				"eslint_d",
				"htmlhint",
				"prettier",
				-- XML (Odoo views), C/C++, shell
				"lemminx",
				"clangd",
				"bash-language-server",
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
		},
		opts = {},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				-- defaults
				"vim",
				"lua",
				"vimdoc",
				"query",

				-- python & data
				"python",
				"toml",
				"json",
				"yaml",
				"sql",
				"regex",

				-- web dev & Odoo
				"html",
				"css",
				"scss",
				"javascript",
				"typescript",
				"tsx",
				"xml",

				-- low level & tools
				"c",
				"cpp",
				"bash",
				"markdown",
				"markdown_inline",
				"gitcommit",
				"diff",
			},
		},
	},
}
