require("nvchad.options")
local vim = vim
local opt = vim.opt
opt.foldcolumn = "1"
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.clipboard = "unnamedplus"
-- add yours here!
