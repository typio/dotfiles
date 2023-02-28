return {
  {
    'nvim-telescope/telescope.nvim',
    -- cant lazy load to hijack netrw
    lazy = false,
    version = '0.1.0',
    dependencies = { 'nvim-lua/plenary.nvim', "xiyaowong/telescope-emoji.nvim" },
    keys = {
      { '<leader>ff',  '<cmd> Telescope file_browser path=%:p:h <CR>',                           desc = 'Telescope: File browser' },
      { '<leader>pwd', '<cmd> Telescope file_browser <CR>',                                      desc = 'Telescope: File browser at pwd' },
      { '<leader>fz',  '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>', desc = 'Telescope: File/folder fuzzy finder' },
      { '<leader>fw',  '<cmd> Telescope live_grep <CR>',                                         desc = 'Telescope: Live grep' },
      { '<leader>fb',  '<cmd> Telescope buffers <CR>',                                           desc = 'Telescope: Buffers' },
      { '<leader>fh',  '<cmd> Telescope help_tags <CR>',                                         desc = 'Telescope: Help tags' },
      { '<leader>fo',  '<cmd> Telescope oldfiles <CR>',                                          desc = 'Telescope: Old files' },
      { '<leader>tk',  '<cmd> Telescope keymaps <CR>',                                           desc = 'Telescope: Keymaps' },

      { '<leader>fp',  "<cmd> Telescope planets <CR>",                                           desc = "Telescope: Planets" },
      { '<leader>fe',  "<cmd> Telescope emoji <CR>",                                             desc = "Telescope: Emoji" },

      -- Need to figure out how to make this work with the way i am doing custom
      -- themes
      -- { '<leader>th',  '<cmd> Telescope colorscheme <CR>',                                       desc = 'Telescope: Themes' },
      { '<leader>cm',  '<cmd> Telescope git_commits <CR>',                                       desc = 'Telescope: Git commits' },
      { '<leader>gt',  '<cmd> Telescope git_status <CR>',                                        desc = 'Telescope: Git status' },
    },
    config = function()
      local fb_actions = require('telescope').extensions.file_browser.actions
      require('telescope').setup {
        pickers = {
          colorscheme = {
            enable_preview = true
          }
        },
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
          },
          prompt_prefix = '   ',
          selection_caret = '  ',
          entry_prefix = '  ',
          initial_mode = 'normal',
          selection_strategy = 'reset',
          sorting_strategy = 'ascending',
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          file_sorter = require('telescope.sorters').get_fuzzy_file,
          file_ignore_patterns = { 'node_modules' },
          generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
          path_display = { 'truncate' },
          winblend = 0,
          border = {},
          borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
          color_devicons = true,
          set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
          file_previewer = require('telescope.previewers').vim_buffer_cat.new,
          grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
          qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
          -- Developer configurations: Not meant for general override
          buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
          mappings = {
            n = { ['q'] = require('telescope.actions').close },
          },
        },
        extensions = {
          file_browser = {
            hijack_netrw = true,
            mappings = {
              ['i'] = {},
              ['n'] = {
                ['<C-r>'] = fb_actions.rename,
                ['<C-d>'] = fb_actions.remove,
                ['<C-n>'] = fb_actions.create,
              }
            }
          }
        },
        extensions_list = { 'file_browser' }
      }

      require('telescope').load_extension('file_browser')
      require('telescope').load_extension('emoji')
    end
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
  }
}
