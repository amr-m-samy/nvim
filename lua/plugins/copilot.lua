-- Copilot inline suggestions only (works on the free Copilot plan).
-- Chat, explanations and multi-file edits are handled by Claude Code (plugins/claude_code.lua).
-- First time: run :Copilot auth to sign in with GitHub.
return {
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
	keys = {
		{
			"<leader>tc",
			function()
				require("copilot.suggestion").toggle_auto_trigger()
				vim.notify("Copilot auto suggestions (this buffer): " .. (vim.b.copilot_suggestion_auto_trigger and "on" or "off"))
			end,
			desc = "Toggle Copilot auto suggestions (buffer)",
		},
	},
}
