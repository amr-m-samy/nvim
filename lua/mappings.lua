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
map("n", "<leader>dc", function()
	require("dap-python").debug_configuration()
end)

-- map("n", "<Leader>B", require("dap").toggle_breakpoint, {})

map("i", "<C-f>", 'copilot#Accept("")', {
	expr = true, -- Evaluate the Copilot function
	replace_keycodes = false, -- to prevent <80>@7 from appearing in the end of the line
	-- noremap = true,
	silent = true,
	desc = "Copilot Accept",
})

-- write a keymap to :Copilot panel
map("n", "<F2>", ":Copilot panel<CR>", { noremap = true, silent = true, desc = "Copilot: Open panel" })
-- Accept one word of the current suggestion
map("i", "<C-g>", "<Plug>(copilot-accept-word)", { silent = true, desc = "Copilot: Accept next word" })
--
-- Dismiss the current suggestion
map("i", "<C-\\>", "<Plug>(copilot-dismiss)", { silent = true, desc = "Copilot: Dismiss suggestion" })

-- Cycle to the next suggestion
map("i", "<M-]>", "<Plug>(copilot-next)", { silent = true, desc = "Copilot: Next suggestion" })

-- Cycle to the previous suggestion
map("i", "<M-[>", "<Plug>(copilot-previous)", { silent = true, desc = "Copilot: Previous suggestion" })

-- Explicitly request a suggestion
map("i", "<M-\\>", "<Plug>(copilot-suggest)", { silent = true, desc = "Copilot: Request suggestion" })

-- Accept the next line of the current suggestion
map("i", "<C-d>", "<Plug>(copilot-accept-line)", { silent = true, desc = "Copilot: Accept next line" })

map("i", "<C-a>", [[<Esc>:lua ToggleArabicMode()<CR>i]], { noremap = true, silent = true })
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
