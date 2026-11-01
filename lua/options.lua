require("nvchad.options")

local opt = vim.opt

-- Folding with Neovim's built-in Tree-sitter folds (nvim_treesitter#foldexpr is deprecated)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldcolumn = "1"
opt.foldlevel = 99 -- open every fold when a file is opened
opt.foldlevelstart = 99

opt.clipboard = "unnamedplus"

-- Editing comfort
opt.scrolloff = 8 -- keep context lines above and below the cursor
opt.colorcolumn = "80" -- matches the 79-char Python line length used by the formatter
opt.undofile = true -- persistent undo across restarts
opt.ignorecase = true
opt.smartcase = true
opt.splitright = true
opt.splitbelow = true
opt.confirm = true -- ask to save instead of failing on :q with unsaved changes
