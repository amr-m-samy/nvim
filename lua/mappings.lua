require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

map("n", "<Leader>db", function()
	require("dap").toggle_breakpoint()
end)
map("n", "<F5>", function()
	require("dap").continue()
end, { desc = "Debugger continue" })
map("n", "<F6>", function()
	require("dap").step_over()
end, { desc = "Debugger step_over" })
map("n", "<F7>", function()
	require("dap").step_into()
end, { desc = "Debugger step_into" })
map("n", "<F8>", function()
	require("dap").step_out()
end, { desc = "Debugger step_out" })

map("n", "<F3>", function()
	require("dap").restart()
end, { desc = "Debugger restart" })

map("n", "<F4>", function()
	require("dap").disconnect()
end, { desc = "Debugger stop" })

map("n", "<leader>dn", function()
	require("dap-python").test_method()
end)
-- map("n", "<Leader>B", require("dap").toggle_breakpoint, {})
