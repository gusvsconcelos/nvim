local key = vim.keymap

-- general shortcuts
key.set("n", "<leader>l", vim.cmd.Lazy, { desc = "Go to Lazy" })
key.set("n", "<leader>m", vim.cmd.Mason, { desc = "Go to Mason" })

-- general utilities
key.set("n", "<leader>e", vim.cmd.NvimTreeToggle, { desc = "Toggle explorer" })
key.set("n", "<leader>/", vim.cmd.nohlsearch, { desc = "Clear search highlight" })
key.set("n", "<leader>c", vim.cmd.CommentToggle, { desc = "Comment line" })

key.set(
	"v",
	"<leader>cv",
	":'<,'>CommentToggle<CR>",
	{ noremap = true, silent = true, desc = "Comment selected lines" }
)

key.set(
	"n",
	"<leader>r",
	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	{ desc = "Replace word under cursor" }
)

key.set("x", "<leader>p", "'_dP", { desc = "Paste without losing the current word" })

-- save file with ctrl+s
key.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
key.set("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })

-- move selected lines up and down through the editor
key.set("v", "K", ":m '<-2<CR>gv=gv")
key.set("v", "J", ":m '>+1<CR>gv=gv")

key.set("n", "J", "mzJ`z") -- keeps cursor on place while applying line after line
key.set("n", "<C-d>", "<C-d>zz") -- keeps cursor on the middle while jumping 'pages'
key.set("n", "<C-u>", "<C-u>zz") -- keeps cursor on the middle while jumping 'pages'
key.set("n", "n", "nzzzv") -- keeps cursor on the middle while searching
key.set("n", "N", "Nzzzv") -- keeps cursor on the middle while searching

-- window management
key.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
key.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
key.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
key.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- lsp keymaps
key.set("n", "gd", function()
	vim.lsp.buf.definition()
end)
key.set("n", "K", function()
	vim.lsp.buf.hover()
end)
key.set("n", "[d", function()
	vim.diagnostic.goto_next()
end)
key.set("n", "]d", function()
	vim.diagnostic.goto_prev()
end)
key.set("n", "<leader>vd", function()
	vim.diagnostic.open_float()
end)
key.set("n", "<leader>vws", function()
	vim.lsp.buf.workspace_symbol()
end)
key.set("n", "<leader>vca", function()
	vim.lsp.buf.code_action()
end)
key.set("n", "<leader>vrr", function()
	vim.lsp.buf.references()
end)
key.set("n", "<leader>vrn", function()
	vim.lsp.buf.rename()
end)
key.set("i", "<C-h>", function()
	vim.lsp.buf.signature_help()
end)

-- Toggle LSP diagnostics
local function hide_diagnostics()
	vim.diagnostic.config({ -- https://neovim.io/doc/user/diagnostic.html
		virtual_text = false,
		signs = false,
		underline = false,
	})
end
local function show_diagnostics()
	vim.diagnostic.config({
		virtual_text = true,
		signs = true,
		underline = true,
	})
end

vim.keymap.set("n", "<leader>dh", hide_diagnostics, { desc = "Hide LSP diagnostics" })
vim.keymap.set("n", "<leader>ds", show_diagnostics, { desc = "Show LSP diagnostics" })
