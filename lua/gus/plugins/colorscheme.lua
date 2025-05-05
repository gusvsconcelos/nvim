return {
  { 'folke/tokyonight.nvim' },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,

    config = function()
      require('catppuccin').setup({
        color_overrides = {
          mocha = {
            base = '#11111b',
            mantle = '#11111b',
            crust = '#11111b',
          },
        },
      })
    end,
  },
  {
    'shaunsingh/nord.nvim',
    priority = 1000,
  },
}
