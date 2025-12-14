return {
  { 'folke/tokyonight.nvim', lazy = false, priority = 1000 },
  { 'catppuccin/nvim', name = 'catppuccin', lazy = false, priority = 1000 },
  { 'rose-pine/neovim', name = 'rose-pine', lazy = false, priority = 1000 },
  {
    'navarasu/onedark.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup({
        style = 'warmer',
      })
      require('onedark').load()
    end,
  },
}
