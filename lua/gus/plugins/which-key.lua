return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    require('which-key').setup({
      icons = {
        separator = '󰌌',
        rules = false,
      },
      layout = {
        spacing = 8,
      },
    })
    require('which-key').add({
      { '<leader>b', group = 'Bufferline' },
      { '<leader>d', group = 'Diagnostics' },
      { '<leader>e', group = 'Explorer' },
      { '<leader>h', group = 'Templates' },
      { '<leader>l', group = 'LSP' },
      { '<leader>p', group = 'Plugins' },
      { '<leader>t', group = 'Telescope' },
      { '<leader>u', group = 'Utilities' },
      { '<leader>w', group = 'Windows' },
      { '<C-h>', desc = 'Signature help' },
      { '[d', desc = 'Next diagnostic' },
      { ']d', desc = 'Previous diagnostic' },
      { 'gd', desc = 'Go to definition' },
    })
  end,
}
