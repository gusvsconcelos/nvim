local key = vim.keymap.set

-- Plugins
key('n', '<leader>pl', vim.cmd.Lazy, { desc = 'Lazy' })
key('n', '<leader>pm', vim.cmd.Mason, { desc = 'Mason' })

-- Explorer
key('n', '<leader>ex', vim.cmd.NvimTreeToggle, { desc = 'Toggle explorer' })
key('n', '<leader>ef', function()
  local view = require('nvim-tree.view')
  local api = require('nvim-tree.api')
  local cur = vim.api.nvim_get_current_win()
  if view.is_visible() then
    local tree = view.get_winnr()
    if tree > 0 then
      if cur == tree then
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
          if win ~= tree then
            vim.api.nvim_set_current_win(win)
            break
          end
        end
      else
        vim.api.nvim_set_current_win(tree)
      end
    end
  else
    api.tree.toggle()
  end
end, { desc = 'Focus explorer' })

-- Utilities
key('n', '<leader>u/', vim.cmd.nohlsearch, { desc = 'Clear highlight' })
key('n', '<leader>uc', vim.cmd.CommentToggle, { desc = 'Toggle comment' })
key('v', '<leader>uc', ':\'<,\'>CommentToggle<CR>', { desc = 'Toggle comment' })
key('n', '<leader>up', function() vim.cmd('Markview toggle') end, { desc = 'Markdown preview' })
key('n', '<leader>uw', function() vim.cmd('set wrap!') end, { desc = 'Toggle wrap' })
key('n', '<leader>ur', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', { desc = 'Replace word' })
key('n', '<leader>ug', vim.cmd.Git, { desc = 'Git status' })
key(
  { 'n', 'v' },
  '<leader>uf',
  function() require('conform').format({ lsp_fallback = true, async = false, timeout_ms = 500 }) end,
  { desc = 'Format file or range' }
)

-- Telescope
key('n', '<leader>tf', function() require('telescope.builtin').find_files() end, { desc = 'Find files' })
key('n', '<leader>tg', function() require('telescope.builtin').live_grep() end, { desc = 'Live grep' })
key('n', '<leader>tb', function() require('telescope.builtin').buffers() end, { desc = 'Find buffers' })
key('n', '<leader>th', function() require('telescope.builtin').help_tags() end, { desc = 'Help' })
key('n', '<C-g>', function() require('telescope.builtin').git_files() end, { desc = 'Git files' })

-- Save
key('n', '<C-s>', ':w<CR>', { desc = 'Save file' })
key('i', '<C-s>', '<Esc>:w<CR>', { desc = 'Save file' })

-- Move lines
key('v', 'K', ':m \'<-2<CR>gv=gv', { desc = 'Move line up' })
key('v', 'J', ':m \'>+1<CR>gv=gv', { desc = 'Move line down' })
key('n', 'J', 'mzJ`z', { desc = 'Join lines' })
key('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down' })
key('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up' })
key('n', 'n', 'nzzzv', { desc = 'Next search' })
key('n', 'N', 'Nzzzv', { desc = 'Previous search' })

-- Windows
key('n', '<leader>wv', '<C-w>v', { desc = 'Split vertical' })
key('n', '<leader>wh', '<C-w>s', { desc = 'Split horizontal' })
key('n', '<leader>we', '<C-w>=', { desc = 'Equal splits' })
key('n', '<leader>wx', '<cmd>close<CR>', { desc = 'Close split' })

-- LSP
key('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
key('n', 'K', vim.lsp.buf.hover, { desc = 'Hover info' })
key('n', '[d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
key('n', ']d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
key('n', '<leader>ld', vim.diagnostic.open_float, { desc = 'Diagnostic float' })
key('n', '<leader>lw', vim.lsp.buf.workspace_symbol, { desc = 'Workspace symbols' })
key('n', '<leader>la', vim.lsp.buf.code_action, { desc = 'Code actions' })
key('n', '<leader>lr', vim.lsp.buf.references, { desc = 'References' })
key('n', '<leader>ln', vim.lsp.buf.rename, { desc = 'Rename symbol' })
key('i', '<C-h>', vim.lsp.buf.signature_help, { desc = 'Signature help' })

-- Diagnostics toggle
local function hide_diag() vim.diagnostic.config({ virtual_text = false, signs = false, underline = false }) end
local function show_diag() vim.diagnostic.config({ virtual_text = true, signs = true, underline = true }) end
key('n', '<leader>dh', hide_diag, { desc = 'Hide diagnostics' })
key('n', '<leader>ds', show_diag, { desc = 'Show diagnostics' })

-- HTML template
local function html5()
  local buf = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  if #lines > 0 and vim.fn.confirm('Overwrite?', '&Yes\n&No', 2) ~= 1 then return end
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
    '<!doctype html>',
    '<html lang="en">',
    '<head>',
    '  <meta charset="UTF-8" />',
    '  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
    '  <title>Title</title>',
    '</head>',
    '<body></body>',
    '</html>',
  })
  vim.bo[buf].filetype = 'html'
end
key('n', '<leader>hh', html5, { desc = 'HTML5 template' })
