return {
	-- Other plugins...
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		lazy = false,
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
			{ "MunifTanjim/nui.nvim" },
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			suggestion = {
				auto_trigger = true,
				debounce = 100,
			},
			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
}
