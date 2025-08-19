return {
  'nvim-lualine/lualine.nvim',

  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    local function mode() return [[]] end
    -- local function node() return [[ ]] end

    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        -- section_separators = { left = '▊', right = '▊' },
        -- section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        -- disabled_filetypes = { 'NvimTree' },
        globalstatus = true,
      },

      sections = {
        lualine_a = { mode },
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
        lualine_x = { { 'diagnostics', sources = { 'nvim_diagnostic' } } },
        lualine_y = { 'filetype' },
        lualine_z = {},
      },

      inactive_sections = {
        lualine_a = { mode },
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
        lualine_x = { { 'diagnostics', sources = { 'nvim_diagnostic' } }, 'filetype' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    })
  end,
}
