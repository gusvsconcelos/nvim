return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('conform').setup({
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        python = { 'autopep8', 'isort' },
        lua = { 'stylua' },
        -- php = { 'php-cs-fixer' },
      },

      -- formatters = {
      --   ['php-cs-fixer'] = {
      --     command = 'php-cs-fixer',
      --     args = {
      --       'fix',
      --       '--rules=@PSR12', -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
      --       '$FILENAME',
      --     },
      --     stdin = false,
      --   },
      -- },

      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    })
  end,
}
