-- import options and keymaps
require("gus.options")
require("gus.keymaps")

-- setup neovim to use my system's clipboard
vim.opt.clipboard:append("unnamedplus")

-- initialize lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- import and install plugins
require("lazy").setup("gus.plugins")

-- setup my editor's color scheme
vim.cmd([[colorscheme tokyonight-night]])
-- vim.cmd([[colorscheme gruvbox]])
-- vim.cmd([[colorscheme catppuccin]])

-- setup lsp keymap description for `which-key` plugin
local wk = require("which-key")

wk.register({
	["gd"] = { "Go to definition" },
	["[d"] = { "Go to next diagnostic" },
	["]d"] = { "Go to previous diagnostic" },
	["<leader>vd"] = { "Open diagnostic float window" },
	["<leader>vws"] = { "Search symbols on workspace" },
	["<leader>vca"] = { "Show code actions" },
	["<leader>vrr"] = { "Show symbols references" },
	["<leader>vrn"] = { "Rename symbols" },
	["<C-h>"] = { "Show signature help" },
})

wk.setup()
