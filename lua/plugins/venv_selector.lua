-- Pick the Python virtual environment (venv, .venv, uv, conda, Odoo venvs) for pyright and debugpy.
-- Needs `fd` (AlmaLinux/Fedora: `sudo dnf install fd-find`, Debian/Ubuntu: `sudo apt install fd-find`).
-- The plugin stays disabled until fd is installed, instead of erroring on every Python file.
local has_fd = vim.fn.executable("fd") == 1 or vim.fn.executable("fdfind") == 1

return {
	"linux-cultist/venv-selector.nvim",
	cond = has_fd,
	dependencies = { "nvim-telescope/telescope.nvim" },
	ft = "python",
	cmd = "VenvSelect",
	opts = {},
	keys = {
		{ "<leader>pv", "<cmd>VenvSelect<cr>", desc = "Python: select virtualenv" },
	},
}
