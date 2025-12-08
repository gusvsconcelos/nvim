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
    -- Mason setup
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
        -- LSP
        'lua_ls',
        'ts_ls',
        'html',
        'cssls',
        'tailwindcss',
        'pyright',
        'intelephense',
      },
      automatic_installation = true,
    })

    -- LSP config
    local servers = { 'lua_ls', 'eslint', 'ts_ls', 'html', 'cssls', 'tailwindcss', 'pyright', 'intelephense' }
    for _, server in ipairs(servers) do
      local opts = server == 'lua_ls'
          and {
            settings = {
              Lua = {
                diagnostics = { globals = { 'vim' } },
              },
            },
          }
        or {}
      vim.lsp.config(server, opts)
    end

    -- Completion setup
    local cmp = require('cmp')
    cmp.setup({
      snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({ { name = 'nvim_lsp' }, { name = 'luasnip' } }, { { name = 'buffer' } }),
    })

    -- Diagnostics setup
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
      virtual_text = { prefix = '' },
    })

    -- Fidget setup
    require('fidget').setup({
      notification = {
        window = {
          winblend = 0,
        },
      },
    })
  end,
}
