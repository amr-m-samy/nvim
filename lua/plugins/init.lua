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
			-- Tracks the main branch: the last tagged release (1.1.0) still calls the
			-- deprecated vim.tbl_flatten, which shows a warning on every live grep.
			"nvim-telescope/telescope-live-grep-args.nvim",
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

	-- nvim-treesitter `main` branch (the old `master` branch is archived and breaks on nvim 0.12).
	-- Needs the tree-sitter CLI (built with `cargo install --locked tree-sitter-cli`) and a C compiler.
	-- `main` no longer highlights by itself: the FileType autocmd below starts it per buffer.
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false, -- main does not support lazy-loading
		build = ":TSUpdate",
		config = function()
			-- NvChad's treesitter opts also load base46's highlight groups; keep that.
			pcall(function()
				dofile(vim.g.base46_cache .. "syntax")
				dofile(vim.g.base46_cache .. "treesitter")
			end)

			-- Make the cargo-built tree-sitter CLI visible even if the shell PATH lacks ~/.cargo/bin.
			local cargo_bin = vim.fn.expand("~/.cargo/bin")
			if vim.fn.isdirectory(cargo_bin) == 1 and not vim.env.PATH:find(cargo_bin, 1, true) then
				vim.env.PATH = cargo_bin .. ":" .. vim.env.PATH
			end

			local ts = require("nvim-treesitter")
			ts.setup()
			ts.install({
				-- defaults
				"vim",
				"lua",
				"luadoc",
				"printf",
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
			})

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
				callback = function(args)
					-- Silently skip filetypes that have no installed parser.
					if pcall(vim.treesitter.start, args.buf) then
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
}
