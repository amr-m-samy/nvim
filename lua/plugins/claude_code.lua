-- Claude Code inside Neovim: Claude sees your open file and selection, and proposes
-- edits as native diffs (:w to accept, :q to reject).
-- Requires the CLI: npm install -g @anthropic-ai/claude-code, then run `claude` once to sign in.
return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	cmd = { "ClaudeCode", "ClaudeCodeFocus", "ClaudeCodeSend", "ClaudeCodeAdd", "ClaudeCodeTreeAdd" },
	opts = {},
	keys = {
		{ "<leader>a", nil, desc = "AI/Claude Code" },
		{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Claude: toggle" },
		{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Claude: focus" },
		{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Claude: resume a session" },
		{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Claude: continue last session" },
		{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Claude: add current file" },
		{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Claude: send selection" },
		{
			"<leader>as",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Claude: add file from tree",
			ft = { "NvimTree", "neo-tree", "oil" },
		},
		{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Claude: accept diff" },
		{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Claude: deny diff" },
	},
}
