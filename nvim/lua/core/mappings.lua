-- leader is set in init.lua
----- NORMAL MODE -----
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left pane' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom pane' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top pane' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right pane' })

vim.keymap.set('n', '<C-s>', '<cmd> w<CR>', { desc = 'Save file' })

vim.keymap.set('n', 'U', '<cmd> redo<CR>', { desc = 'Redo' })

vim.keymap.set("n", "<leader>p", '"_dP', { desc = "Paste without losing register" })

vim.keymap.set('n', '<leader>sp', '<cmd> split<CR><C-w>w', { desc = 'Split pane horizontally' })
vim.keymap.set('n', '<leader>sv', '<cmd> vsplit<CR><C-w>w', { desc = 'Split pane vertically' })
vim.keymap.set('n', '<C-x>', '<cmd> bd<CR>', { desc = 'Close current buffer' })

vim.keymap.set("n", "<C-o>", "<cmd>! ~/.config/wezterm/toggle_opacity.sh<CR>", { desc = "Toggle opacity" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half a page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half a page" })

----- INSERT MODE -----
vim.keymap.set('i', '<C-b>', '<ESC>^i', { desc = 'Go to beginning of line' })
vim.keymap.set('i', '<C-e>', '<End>', { desc = 'Go to end of line' })

vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Left' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Down' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'Up' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Right' })

----- VISUAL MODE -----
vim.keymap.set('v', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = 'Paste without yanking' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move visual block down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move visual block up' })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and stay in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and stay in visual mode" })
