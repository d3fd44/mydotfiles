---@diagnostic disable: undefined-global

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.scrolloff = 8
vim.opt.laststatus = 0
vim.opt.icon = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.equalalways = true

vim.cmd("autocmd Filetype make setlocal noexpandtab")
