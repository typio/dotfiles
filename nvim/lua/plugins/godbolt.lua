return {
  'p00f/godbolt.nvim',
  keys = {
    { '<leader>gb', ":'<,'>Godbolt<CR>", desc = 'Godbolt: Show for visual selection', mode = 'v' }
  },
  opts = {
    languages = {
      cpp = { compiler = "g122", options = {} },
      c = { compiler = "cg122", options = {} },
      zig = { compiler = "z0100", options = {} },
      rust = {
        compiler = "r1670",
        options = {
          userArguments = "-C opt-level=3",
          filters = {
            labels = true,
            libraryCode = true,
          }
        }
      }
    },
  }
}
