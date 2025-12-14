return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
      },
      sections = {
        lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 3) end } },
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
        lualine_y = {},
        lualine_z = {},
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
