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
      lualine_bold = true,
      on_colors = function(colors) colors.bg_statusline = colors.none end,
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
