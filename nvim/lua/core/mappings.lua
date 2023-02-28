-- Map leader is set in init.lua

local wk = require("which-key")

wk.setup({
	show_help = false,
	show_keys = false,
	key_labels = { ["<leader>"] = "SPC" },
})

----- INSERT MODE -----
vim.keymap.set('i', 'jj', '<ESC>', { desc = 'jj to escape to normal mode' })

vim.keymap.set('i', '<C-b>', '<ESC>^i', { desc = 'Go to beginning of line' })
vim.keymap.set('i', '<C-e>', '<End>', { desc = 'Go to end of line' })

vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Left' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Down' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'Up' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Right' })

----- NORMAL MODE -----
vim.keymap.set('n', '<C-s>', '<cmd> silent w <CR>', { desc = 'Save file' })

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left pane' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom pane' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to top pane' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right pane' })

vim.keymap.set('n', '<leader>sp', ':split<Return><C-w>w', { desc = 'Split pane horizontally' })
vim.keymap.set('n', '<leader>sv', ':vsplit<Return><C-w>w', { desc = 'Split pane vertically' })

vim.keymap.set("n", "<C-o>", "<cmd>! ~/.config/wezterm/toggle_opacity.sh<CR><CR>", { desc = "Toggle opacity" })

----- VISUAL MODE -----
vim.keymap.set('v', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = 'Paste without yanking' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move visual block down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move visual block up' })

local leader = {
	["f"] = {
		name = "+telescope",
	},
	["o"] = {
		name = "+open",
		["d"] = { "<cmd> DiffviewOpen<CR>", "DiffView" },
	},
	["u"] = { "<cmd> UndotreeToggle<CR>", "Undo Tree" },
	["g"] = {
		name = "+goto",
		["d"] = { "<cmd> Telescope lsp_definitions<CR>", "Definition" },
		["i"] = { "<cmd> Telescope lsp_implementation<CR>", "Implementation" },
		["r"] = { "<cmd> Telescope lsp_references<CR>", "References" },
	},
	["c"] = {
		name = "+code",
	},
}

wk.register(leader, { prefix = "<leader>" })
