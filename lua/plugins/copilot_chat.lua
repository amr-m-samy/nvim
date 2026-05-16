return {
	-- 1. The Core Engine (Pure Lua Version)
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = { enabled = false },
				suggestion = {
					enabled = true, -- Changed to TRUE so you get inline ghost text
					auto_trigger = true, -- Automatically show suggestions as you type
					debounce = 75,
					keymap = {
						-- NvChad uses Tab for its own menu, so we map Ctrl+l to accept Copilot's ghost text
						accept = "<C-l>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
			})
		end,
	},

	-- 2. The Chat Engine
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		lazy = false,
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- Tells the chat to use the Lua engine
			{ "nvim-lua/plenary.nvim", branch = "master" },
			{ "MunifTanjim/nui.nvim" },
		},
		build = "make tiktoken",
		opts = {
			show_help = "yes",
		},
		keys = {
			{ "<leader>cc", ":CopilotChat<CR>", desc = "Open Copilot Chat" },
		},
	},
}
