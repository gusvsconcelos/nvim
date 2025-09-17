-- setup mapleader
vim.g.mapleader = ' '

-- setup neovim to use system's clipboard
vim.opt.clipboard:append('unnamedplus')

-- enable line numbers and relative numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- activate sign column
vim.opt.signcolumn = 'yes'

-- hide fillchars
vim.opt.fillchars = { eob = ' ' }

-- enables 24-bit RGB colors on the TUI
vim.opt.termguicolors = true

-- better tabbing and indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- deactivate swapfile and backup
vim.opt.swapfile = false
vim.opt.backup = false

-- deactivate wrap
vim.opt.wrap = false

-- deactivate highlight on search but keeps while typing
vim.hlsearch = false
vim.opt.incsearch = true

-- keeps a minimum of 10 lines while scrolling
vim.opt.scrolloff = 10

-- set updatetime to 50ms
vim.opt.updatetime = 50

-- indicate ideal line length limit at 80th column
-- vim.opt.colorcolumn = '80'

-- deactivate cursorline highlight
vim.opt.cursorline = false

-- disable native status line
vim.o.showmode = false
vim.o.ruler = false
vim.o.laststatus = 0

-- enable mousemoveevent
vim.opt.mousemoveevent = true
