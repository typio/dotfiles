return {
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = function()
      local theme, _ = require('core.colors')
      -- TODO: Make background transparent for lualine and add more pair-matches
      -- to the other themes. Sadly i only use tokyonight and jellybeans.
      local lualine_theme

      if theme.theme_name == 'tokyonight' then
        lualine_theme = 'palenight'
      elseif theme.theme_name == 'jellybeans' then
        lualine_theme = 'powerline'
      else
        lualine_theme = 'powerline'
      end

      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = lualine_theme,
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          disabled_filetypes = {},
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = {
            {
              'filename',
              file_status = true, -- displays file status (readonly status, modified status)
              path = 0,           -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
          },
          lualine_x = {
            {
              'diagnostics',
              sources = { 'nvim_diagnostic' },
              symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            },
            'encoding',
            'filetype',
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            {
              'filename',
              file_status = true, -- displays file status (readonly status, modified status)
              path = 1,           -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
          },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = { 'fugitive' },
      })
    end
  }
}
