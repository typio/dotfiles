local o = vim.o

vim.g.mapleader = " "

-- settings
o.softtabstop = 2
o.shiftwidth = 2
o.tabstop = 2
o.expandtab = true
o.joinspaces = false

o.number = true
o.relativenumber = true

o.hlsearch = false
o.incsearch = true

o.smartcase = true
o.scrolloff = 15
o.hidden = true
o.wrap = false
o.swapfile = false
o.backup = false
o.undofile = true
o.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
o.backspace = "indent,eol,start"
o.foldmethod = "marker"
o.title = true
o.errorbells = false
o.cursorline = false
o.cursorcolumn = false
o.splitright = true
o.splitbelow = true
o.completeopt = "menuone,noselect,noinsert"
o.shortmess = "c"
o.clipboard = "unnamedplus"
o.updatetime = 50
o.signcolumn = "yes"
o.lazyredraw = false
o.timeoutlen = 250
o.showmode = false
o.colorcolumn = 80
--o.shortmess = "filnxtToOFWIcC"

-- o.foldexpr = "nvim_treesitter#foldexpr()"
-- o.foldlevel = 6
-- o.foldmethod = "expr"

vim.opt.list = true

o.colo = "kanagawa"
