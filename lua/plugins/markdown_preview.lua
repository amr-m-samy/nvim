-- GitHub-style live Markdown preview in the browser.
-- :MarkdownPreview / :MarkdownPreviewStop / :MarkdownPreviewToggle
return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
	ft = { "markdown" },
	build = "cd app && npm install",
	init = function()
		vim.g.mkdp_auto_close = 1 -- close the preview tab when leaving the buffer
		vim.g.mkdp_page_title = "${name}"
	end,
	keys = {
		{ "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", ft = "markdown", desc = "Markdown: toggle preview" },
	},
}
