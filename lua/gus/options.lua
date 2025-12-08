vim.g.mapleader = ' '
vim.opt.clipboard = 'unnamedplus'

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.fillchars = { eob = ' ' }
vim.opt.fillchars:append({ vert = ' ' })
vim.opt.termguicolors = true
vim.opt.cursorline = false
vim.opt.scrolloff = 10
vim.opt.wrap = false
vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.mousemoveevent = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.updatetime = 50
