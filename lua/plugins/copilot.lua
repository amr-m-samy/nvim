return {
	-- Other plugins...
	{
		"github/copilot.vim",
		config = function()
			-- Optional: Add configuration for Copilot here.
			vim.g.copilot_no_tab_map = true -- Example: disable default <Tab> mapping
		end,
	},
}
