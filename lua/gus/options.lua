-- setup my mapleader
vim.g.mapleader = " "

-- setup line numbers and relative numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- setup better tabbing and indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- deactivate the editor's wrap
vim.opt.wrap = false

-- deactivate swapfile and backup
vim.opt.swapfile = false
vim.opt.backup = false

-- deactivate highlight on search but keeps while typing
vim.hlsearch = false
vim.opt.incsearch = true

-- enables 24-bit RGB colors on the TUI
vim.opt.termguicolors = true

-- keeps a minimum of 8 lines while scrolling
vim.opt.scrolloff = 8
-- activate sign column
vim.opt.signcolumn = "yes"

-- fast
vim.opt.updatetime = 50

-- set a line by the 80th column to indicate the line length limit
vim.opt.colorcolumn = "80"

-- set current line highlight
vim.opt.cursorline = false

-- disable native status line
vim.o.showmode = false
vim.o.ruler = false
vim.o.laststatus = 0
