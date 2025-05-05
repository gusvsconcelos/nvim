return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local tokyo = require('lualine.themes.tokyonight-night')

    tokyo.normal.a.gui = 'bold'
    tokyo.insert.a.gui = 'bold'
    tokyo.visual.a.gui = 'bold'
    tokyo.replace.a.gui = 'bold'
    tokyo.command.a.gui = 'bold'

    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        disabled_filetypes = { 'NvimTree' },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            icon = '',
            -- separator = { left = '', right = '' },
          },
        },
        lualine_b = { 'branch' },
        lualine_c = {
          {
            'filename',
            path = 0,
            symbols = {
              modified = '●',
              readonly = '󰷊',
              unnamed = '󰇘',
              newfile = '󱪝',
            },
          },
        },
        lualine_x = {
          'filetype',
          { 'diagnostics', sources = { 'nvim_diagnostic' } },
        },
        lualine_y = { 'location', 'progress' },
        lualine_z = {
          {
            'os.date("%H:%M")',
            icon = '',
            -- separator = { right = '', left = '' },
          },
        },
      },
      inactive_sections = {
        lualine_a = { { 'mode', icon = '' } },
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            path = 0,
            symbols = {
              modified = '●',
              readonly = '󰷊',
              unnamed = '󰇘',
              newfile = '󱪝',
            },
          },
        },
        lualine_x = { 'filetype' },
        lualine_y = {},
        lualine_z = { { 'os.date("%H:%M")', icon = '' } },
      },
      tabline = {},
      extensions = {},
    })
  end,
}
