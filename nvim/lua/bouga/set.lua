
-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab = 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Smart indent haha
vim.opt.smartindent = true

-- No wrap pls
vim.opt.wrap = false

-- Undotree files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/vim/undodir'
vim.opt.undofile = true

-- Highlight search term
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Colors i guess
vim.opt.termguicolors = true

-- Scroll off = space always visible when scrolling
vim.opt.scrolloff = 10

-- ??
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')
vim.opt.updatetime = 50

-- Color cursor line and max length column
vim.opt.cursorline = true
vim.opt.colorcolumn = '120'

-- Number of fold columns visible (to help keeping track of folds)
vim.opt.foldcolumn = '1'

-- Setting list chars
vim.opt.list = true
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  lead = ' ',
  extends = '>',
  precedes = '<',
  nbsp = '␣',
}
