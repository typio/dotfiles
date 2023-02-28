return {
  {
    'simrat39/rust-tools.nvim',
    ft = 'rust'
  },
  {
    'iurimateus/luasnip-latex-snippets.nvim',
    lazy = false,
    dependencies = { 'L3MON4D3/LuaSnip' },
    config = true,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    lazy = false,
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim',           config = true },
      { 'williamboman/mason-lspconfig.nvim', config = true },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },

    config = function()
      local lsp = require('lsp-zero')

      lsp.preset('recommended')
      lsp.ensure_installed({
        'lua_ls',
        'rust_analyzer',
        'pyright',
      })

      -- Fix undefined global 'vim'
      lsp.configure('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      })

      local cmp = require('cmp')

      local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs( -4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require('luasnip').expand_or_jumpable() then
            vim.fn.feedkeys(
              vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump',
                true, true, true), '')
          elseif vim.b._copilot_suggestion ~= nil then
            vim.fn.feedkeys(
              vim.api.nvim_replace_termcodes(vim.fn['copilot#Accept'](), true,
                true, true), '')
          else
            fallback()
          end
        end, {
          'i',
          's',
        }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require('luasnip').jumpable( -1) then
            vim.fn.feedkeys(
              vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true,
                true, true), '')
          elseif vim.b._copilot_suggestion ~= nil then
            vim.fn.feedkeys(
              vim.api.nvim_replace_termcodes(vim.fn['copilot#Accept'](), true,
                true, true), '')
          else
            fallback()
          end
        end, {
          'i',
          's',
        }),
      })

      lsp.setup_nvim_cmp({
        mapping = cmp_mappings
      })

      lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {},
      })

      lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        -- Disable semantic highlighting
        client.server_capabilities.semanticTokensProvider = nil

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>cws', vim.lsp.buf.workspace_symbol, { desc = "Workspace Symbol" })
        vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = "Open Diagnostics" })
        vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', '<leader>cca', vim.lsp.buf.code_action, { desc = "Code Action" })
        vim.keymap.set('n', '<leader>crr', vim.lsp.buf.references, { desc = "References" })
        vim.keymap.set('n', '<leader>crn', vim.lsp.buf.rename, { desc = "Rename" })
        vim.keymap.set('i', '<C-sh>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = "Format" })
      end)

      local rt = require('rust-tools')
      local rust_analyzer_settings = {
        on_attach = function(client, bufnr)
          local opts = { buffer = bufnr, remap = false }
          -- Disable semantic highlighting
          client.server_capabilities.semanticTokensProvider = nil
        end,
        settings = {
          ['rust-analyzer'] = {
            checkOnSave = {
              allFeatures = true,
              command = 'clippy',
            }
          }
        },
      }

      local rust_lsp = lsp.build_options('rust_analyzer', rust_analyzer_settings)

      lsp.setup()

      require('rust-tools').setup({
        server = rust_lsp,
        tools = {
          inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = '',
            other_hints_prefix = '',
          },
        }
      })

      -- diagnostics
      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      })

      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or border
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end

      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
          local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "always",
            prefix = " ",
            scope = "cursor",
          }
          vim.diagnostic.open_float(nil, opts)
        end,
      })
    end
  }
}
