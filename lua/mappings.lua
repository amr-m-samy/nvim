require("nvchad.mappings")

local map = vim.keymap.set

-- General ------------------------------------------------------------------
map("i", "jj", "<ESC>", { desc = "Escape insert mode" })

map("n", "<leader>fg", function()
	require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "Telescope live grep (with args)" })

-- <leader>fm (format file) comes from NvChad and uses conform.
map("n", "<leader>tf", "<cmd>FormatToggle<CR>", { desc = "Toggle format on save" })

-- Tab navigation
map("n", "<M-.>", "<cmd>tabnext<CR>", { desc = "Next tab" })
map("n", "<M-,>", "<cmd>tabprevious<CR>", { desc = "Previous tab" })

-- Move selected lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })

-- Debugging (nvim-dap) -----------------------------------------------------
map("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Debugger toggle breakpoint" })
map("n", "<leader>dB", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debugger conditional breakpoint" })
map("n", "<leader>du", function()
	require("dapui").toggle()
end, { desc = "Debugger toggle UI" })
map("n", "<F5>", function()
	require("dap").continue()
end, { desc = "Debugger continue" })
map("n", "<F6>", function()
	require("dap").step_into()
end, { desc = "Debugger step_into" })
map("n", "<F7>", function()
	require("dap").step_over()
end, { desc = "Debugger step_over" })
map("n", "<F8>", function()
	require("dap").step_out()
end, { desc = "Debugger step_out" })
map("n", "<F4>", function()
	require("dap").restart()
end, { desc = "Debugger restart" })
map("n", "<F3>", function()
	require("dap").disconnect()
end, { desc = "Debugger stop" })

map("n", "<leader>dm", function()
	require("dap-python").test_method()
end, { desc = "Debugger test method" })
map("n", "<leader>dc", function()
	require("dap-python").test_class()
end, { desc = "Debugger test class" })
map("v", "<leader>ds", function()
	require("dap-python").debug_selection()
end, { desc = "Debugger debug selection" })
map("n", "<leader>df", function()
	require("dap-python").debug_configuration()
end, { desc = "Debugger debug configuration" })

-- Copilot ------------------------------------------------------------------
-- Inline suggestion keys live in plugins/copilot.lua (<leader>tc toggles auto suggestions):
--   <C-l> accept · <M-w> accept word · <M-l> accept line · <M-]>/<M-[> next/prev · <C-]> dismiss
map("n", "<F2>", "<cmd>Copilot panel<CR>", { desc = "Copilot: open panel" })

-- Claude Code keys (<leader>a…) live in plugins/claude_code.lua

-- Arabic -------------------------------------------------------------------
local function toggle_arabic()
	if vim.o.arabic then
		vim.o.arabic = false
		vim.notify("Arabic mode disabled")
	else
		vim.cmd("set arabic norl termbidi")
		vim.notify("Arabic mode enabled")
	end
end

map("i", "<C-g>", toggle_arabic, { desc = "Toggle Arabic mode" })
map("n", "<leader>ta", toggle_arabic, { desc = "Toggle Arabic mode" })

-- vim-visual-multi -----------------------------------------------------------
-- NvChad uses <C-n> for the file tree, so start multi-cursor with <leader>wm
map("n", "<leader>wm", "<Plug>(VM-Start-Normal)", { desc = "Start Visual Multi" })
