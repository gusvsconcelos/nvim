return {
  'neovim/nvim-lspconfig',

  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'j-hui/fidget.nvim',
  },

  config = function()
    local cmp = require('cmp')

    require('fidget').setup({})
    require('mason').setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    })
    require('mason-lspconfig').setup({
      ensure_installed = {
        'lua_ls',
        'eslint',
        'ts_ls',
        'html',
        'cssls',
        'tailwindcss',
        'pyright',
      },
    })

    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end,
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
      }),

      sources = cmp.config.sources({ { name = 'nvim_lsp' }, { name = 'luasnip' } }, { { name = 'buffer' } }),
    })

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅙',
          [vim.diagnostic.severity.INFO] = '󰋼',
          [vim.diagnostic.severity.HINT] = '󰌵',
          [vim.diagnostic.severity.WARN] = '',
        },
        linehl = {
          [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
          [vim.diagnostic.severity.INFO] = 'InfoMsg',
          [vim.diagnostic.severity.HINT] = 'HintMsg',
          [vim.diagnostic.severity.WARN] = 'WarnMsg',
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
          [vim.diagnostic.severity.INFO] = 'InfoMsg',
          [vim.diagnostic.severity.HINT] = 'HintMsg',
          [vim.diagnostic.severity.WARN] = 'WarnMsg',
        },
      },

      float = {
        focusable = true,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },

      virtual_text = {
        prefix = '',
      },
    })
  end,
}
