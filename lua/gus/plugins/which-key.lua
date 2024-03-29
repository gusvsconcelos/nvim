return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 400
	end,
	opts = {},
	config = function()
		-- setup descriptions for lsp keymaps
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
	end,
}
