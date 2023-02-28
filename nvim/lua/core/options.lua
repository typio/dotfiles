vim.opt.rnu = true
vim.opt.number = true

vim.opt.clipboard = 'unnamedplus'

-- global status line
vim.opt.laststatus = 3

-- Indendation/tab settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- replace "~" eof chars with spaces " "
vim.opt.fillchars = { eob = ' ' }

-- enable mouse
vim.opt.mouse = 'a'

-- Number column
vim.opt.numberwidth = 2
vim.opt.ruler = false

-- disable nvim intro
vim.opt.shortmess:append 'sI'

-- column for signs (diagnostics, git, etc)
vim.opt.signcolumn = 'yes'

-- pane splitting settings
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.termguicolors = true
vim.opt.timeoutlen = 400
vim.opt.undofile = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.lazyredraw = false

vim.opt.scrolloff = 15
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.colorcolumn = '99'
vim.opt.cul = true
vim.opt.textwidth = 80

