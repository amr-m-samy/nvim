require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jj", "<ESC>", { desc = "Escape insert mode" })

-- Tab navigation
-- Ctrl + . for tabnext
map({ "n" }, "<M-.>", ":tabnext<CR>", { desc = "Next Tab" })
-- Ctrl + , for tabprevious
map({ "n" }, "<M-,>", ":tabprevious<CR>", { desc = "Previous Tab" })

map("n", "<Leader>db", function()
	require("dap").toggle_breakpoint()
end)
map("n", "<F5>", function()
	require("dap").continue()
end, { desc = "Debugger continue" })
map("n", "<F7>", function()
	require("dap").step_over()
end, { desc = "Debugger step_over" })
map("n", "<F6>", function()
	require("dap").step_into()
end, { desc = "Debugger step_into" })
map("n", "<F8>", function()
	require("dap").step_out()
end, { desc = "Debugger step_out" })

map("n", "<F4>", function()
	require("dap").restart()
end, { desc = "Debugger restart" })

map("n", "<F3>", function()
	require("dap").disconnect()
end, { desc = "Debugger stop" })

map("n", "<leader>dn", function()
	require("dap-python").test_method()
end)

map("n", "<leader>df", function()
	require("dap-python").test_class()
end)

map("n", "<leader>dn", function()
	require("dap-python").debug_selection()
end)

-- map("n", "<Leader>B", require("dap").toggle_breakpoint, {})
