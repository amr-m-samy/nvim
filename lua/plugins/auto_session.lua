return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		-- Will use Telescope if installed or a vim.ui.select picker otherwise
		{ "<leader>fr", "<cmd>SessionSearch<CR>", desc = "Session search" },
		{ "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save session" },
		{ "<leader>wA", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
	},
	config = function()
		require("auto-session").setup({

			suppresled_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			session_lens = {
				-- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
				load_on_setup = true,
				previewer = false,
				mappings = {
					-- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
					delete_session = { "i", "<C-D>" },
					alternate_session = { "i", "<C-S>" },
					copy_session = { "i", "<C-Y>" },
				},
				-- Can also set some Telescope picker options
				-- For all options, see: https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt#L112
				theme_conf = {
					border = true,
					-- layout_config = {
					--   width = 0.8, -- Can set width and height as percent of window
					--   height = 0.5,
					-- },
				},
			},
		})
	end,
}
