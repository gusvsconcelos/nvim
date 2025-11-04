return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
    },
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
      variant = 'moon',
      disable_background = true,
      disable_float_background = true,
    },
  },
}
