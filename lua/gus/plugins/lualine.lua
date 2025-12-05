return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
      },
      sections = {
        lualine_a = { { 'mode', icon = '', separator = { left = '', right = '' }, right_padding = 2 } },
        lualine_b = {
          {
            'filename',
            path = 0,
            symbols = { modified = '●', readonly = '󰷊' },
          },
        },
        lualine_c = {
          { 'branch', icon = '' },
          'diff',
        },
        lualine_x = { { 'diagnostics', sources = { 'nvim_diagnostic' } }, 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { { 'location', separator = { left = '', right = '' }, right_padding = 2 } },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
