return {
	-- Copilot inline suggestions (copilot.lua only; the old copilot.vim duplicate was removed)
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			panel = {
				enabled = true,
				keymap = { open = "<M-CR>" }, -- Alt+Enter in insert mode, or <F2> in normal mode
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					-- NvChad uses Tab for the completion menu, so Copilot uses Ctrl/Alt keys
					accept = "<C-l>",
					accept_word = "<M-w>",
					accept_line = "<M-l>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
		},
	},

	-- Copilot Chat
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
		},
		build = "make tiktoken",
		cmd = {
			"CopilotChat",
			"CopilotChatOpen",
			"CopilotChatToggle",
			"CopilotChatExplain",
			"CopilotChatFix",
			"CopilotChatOptimize",
			"CopilotChatReview",
			"CopilotChatTests",
			"CopilotChatStop",
		},
		opts = {},
	},
}
