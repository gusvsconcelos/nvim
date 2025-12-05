return {
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        diagnostics = 'nvim_lsp',
        separator_style = {
          '',
        },
        indicator = {
          icon = '┃',
        },
        hover = {
          enabled = true,
          delay = 0,
          reveal = { 'close' },
        },
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'Explorer',
            text_align = 'center',
            separator = false,
          },
        },
      },
    },
  },
}
