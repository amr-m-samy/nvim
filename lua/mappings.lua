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

map("n", "<leader>dm", function()
	require("dap-python").test_method()
end, { desc = "Debugger test method" })

map("n", "<leader>dc", function()
	require("dap-python").test_class()
end, { desc = "Debugger test class" })

map("n", "<leader>ds", function()
	require("dap-python").debug_selection()
end, { desc = "Debugger debug selection" })
map("n", "<leader>df", function()
	require("dap-python").debug_configuration()
end, { desc = "Debugger debug configuration" })

------------------------------------------Copilot------------------------------------------
map("i", "ff", 'copilot#Accept("<CR>")', {
	expr = true, -- Evaluate the Copilot function
	replace_keycodes = false, -- to prevent <80>@7 from appearing in the end of the line
	-- noremap = true,
	silent = true,
	desc = "Copilot Accept All Suggestion",
})
map("n", "<F2>", ":Copilot panel<CR>", { noremap = true, silent = true, desc = "Copilot: Open panel" })
-- Accept one word of the current suggestion
map("i", "fw", "<Plug>(copilot-accept-word)", { silent = true, desc = "Copilot: Accept next word" })

-- Dismiss the current suggestion
map("i", "<C-\\>", "<Plug>(copilot-dismiss)", { silent = true, desc = "Copilot: Dismiss suggestion" })

-- Cycle to the next suggestion
map("i", "<M-]>", "<Plug>(copilot-next)", { silent = true, desc = "Copilot: Next suggestion" })

-- Cycle to the previous suggestion
map("i", "<M-[>", "<Plug>(copilot-previous)", { silent = true, desc = "Copilot: Previous suggestion" })

-- Explicitly request a suggestion
map("i", "<M-\\>", "<Plug>(copilot-suggest)", { silent = true, desc = "Copilot: Request suggestion" })

map("i", "fd", "<Plug>(copilot-accept-line)", { silent = true, desc = "Copilot: Accept next line" })
------------------------------------------Arabic---------------------

map("i", "<C-g>", [[<Esc>:lua ToggleArabicMode()<CR>i]], { noremap = true, silent = true })

-- Toggle Arabic mode
function ToggleArabicMode()
	print("Toggling Arabic mode")
	if vim.o.arabic then
		vim.cmd("set noarabic")
		print("Arabic mode disabled")
	else
		vim.cmd("set arabic norl termbidi ")
		print("Arabic mode enabled")
	end
end
--
