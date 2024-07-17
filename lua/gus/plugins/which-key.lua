return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    icons = {
      separator = '󰌌',
      rules = false,
    },
    layout = {
      spacing = 4,
      align = 'center',
    },
    spec = {
      -- LSP shortcuts descriptions
      { '<C-h>', desc = 'Show signature help' },
      { '<leader>vca', desc = 'Show code actions' },
      { '<leader>vd', desc = 'Open diagnostic float window' },
      { '<leader>vrn', desc = 'Rename symbols' },
      { '<leader>vrr', desc = 'Show symbols references' },
      { '<leader>vws', desc = 'Search symbols on workspace' },
      { '[d', desc = 'Go to next diagnostic' },
      { ']d', desc = 'Go to previous diagnostic' },
      { 'gd', desc = 'Go to definition' },
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
