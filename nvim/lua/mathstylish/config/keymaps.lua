local discipline = require("mathstylish.util.discipline")

-- discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Go to normal mode
keymap.set("i", "kj", "<Esc>", opts)

-- Turn off hlsearch
keymap.set("n", "<Esc>", function()
	vim.cmd([[set nohlsearch]])
end, opts)

-- Quit
keymap.set("n", "<leader>q", ":q!<CR>", opts)

-- Save file
keymap.set("n", "<leader>w", ":write<CR>", opts)
-- keymap.set("n", "<C-s>", ":write<CR>", opts)

-- Increment / decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Intellij complete statement
keymap.set("i", "çl", "<Esc>A;<Esc>o", opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Delete a word backwards
keymap.set("n", "db", 'vb"_d')

-- Split window
keymap.set("n", "<leader>vs", ":vsplit<CR>", opts)
keymap.set("n", "<leader>hs", ":split<CR>", opts)

-- Move into window
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize window
keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move line up/down
keymap.set("n", "<A-j>", ":m .+1<CR>==")
keymap.set("n", "<A-k>", ":m .-2<CR>==")
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Buffers
keymap.set("n", "<S-l>", ":bnext<CR>", opts)
keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
keymap.set("n", "<leader>c", ":bdelete %<CR>", opts)

-- VISUAL
-- stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Diagnostic
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

-- Debug table
keymap.set("n", "<leader>dt", function()
	vim.cmd([[ enew | put=execute('lua =package.loaded') ]])
end, opts)
